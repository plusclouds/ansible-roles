#!/bin/bash
# ========================================================= #
#     Install: ./script.sh install
# Basic usage: ./script.sh backup
#        List: ./script.sh list
#     Restore: ./script.sh restore YYYY-MM-DD HH-MM-SS
#        Help: ./script.sh help

# Basic configs of your MySQL Server
BACKUP_PATH="/home/backups/"
MYSQLUSER="root"
MYSQLPASS="123"
MYSQLCFG="/etc/mysql/my.cnf"

# ========================================================= #

if [ $(id -u) != "0" ]; then
	echo "Sorry, I need root privileges!"
fi

MYSQLDATA="`grep --perl-regexp --only-match '(?<=datadir=).+' "$MYSQLCFG"`"
DAY_BACKUP_DIR="${BACKUP_PATH}`date +%Y-%m-%d`/"
BASE_BACKUP="`ls -1 $DAY_BACKUP_DIR 2> /dev/null | grep --max-count=1 --perl-regexp '^.+_BASE'`"

case $1 in
	'backup')
		if [ "$BASE_BACKUP" = "" ]; then
			$0 backup-base
		else
			$0 backup-incremental
		fi
;;
    'backup-base')
		DEST_DIR="${DAY_BACKUP_DIR}`date +%H-%M-%S`_BASE"
		
		if [ "$BASE_BACKUP" != "" ]; then
			echo "Daily base backup already done. Running incremental backup..."
			$0 backup-incremental
			exit 1
		fi
		
		if [ ! -d "$DAY_BACKUP_DIR" ]; then
			mkdir -p "$DAY_BACKUP_DIR"
		fi
		
		innobackupex --defaults-file="$MYSQLCFG" --user="$MYSQLUSER" --password="$MYSQLPASS" --no-timestamp "$DEST_DIR"
;;
    'backup-incremental')
		DEST_DIR="${DAY_BACKUP_DIR}`date +%H-%M-%S`"
		
		if [ "$BASE_BACKUP" = "" ]; then
			echo "Daily base backup not found. Running base backup..."
			$0 backup-base
			exit 1
		fi
		
		innobackupex --defaults-file="$MYSQLCFG" --user="$MYSQLUSER" --password="$MYSQLPASS" \
		--incremental-basedir="${DAY_BACKUP_DIR}${BASE_BACKUP}" \
		--incremental "$DEST_DIR" \
		--no-timestamp
;;
    'restore')
		if [ "`ps aux | grep --only-match mysqld`" != "" ]; then
			read -p "I think mysql-server still running. It's STRONGLY recommended to stop it before restoring any backup to avoid corrupted files. Do you want to continue anyway? [Y/N]" yn
			case $yn in
				[Yy]* ) break;;
				* ) exit;;
			esac
		fi
		
		REQUEST_BACKUP="${BACKUP_PATH}${2}/${3}"
		BASE_BACKUP="${BACKUP_PATH}${2}/`ls ${BACKUP_PATH}${2} | grep --max-count=1 --perl-regexp '^.+_BASE'`"
		TMP_BACKUP="${BACKUP_PATH}${2}/.current_backup"
		
		if [ ! -d "$REQUEST_BACKUP" ] || [ ! $2 ] || [ ! $3 ]; then
			echo "Backup not found!"
			echo "Usage: $0 restore 2011-10-21 13-00-10"
			exit 1
		fi
		
		if [ -d "$MYSQLDATA" ]; then
			mv "$MYSQLDATA" "`grep --perl-regexp --only-match '^.*(?=/$)' <<< ${MYSQLDATA}`_restore-`date +%Y-%m-%d_%H-%M-%S`"
			mkdir "$MYSQLDATA"
		fi
		
		if [ -d "$TMP_BACKUP" ]; then
			rm -rf "$TMP_BACKUP"
		fi
		
		cp --recursive "$BASE_BACKUP" "$TMP_BACKUP"
		innobackupex --apply-log --redo-only "$TMP_BACKUP"
		
		if [ REQUEST_BACKUP != BASE_BACKUP ]; then
			innobackupex --apply-log "$TMP_BACKUP" --incremental-dir="$REQUEST_BACKUP"
		fi
		
		innobackupex --apply-log "$TMP_BACKUP"
		innobackupex --copy-back "$TMP_BACKUP"
		chown -R mysql:mysql "$MYSQLDATA"
		
		rm -rf "$TMP_BACKUP"
;;
    'list')
		echo "============ Available Backups ============"
		for day in $BACKUP_PATH* ; do
			echo "-> `sed 's/.*\///' <<< $day`"
			for hour in $day/* ; do
				echo "	-> `sed 's/.*\///' <<< $hour`"
			done
		done
		echo "==========================================="
;;
	'install')
		wget https://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb
		sudo dpkg -i percona-release_0.1-4.$(lsb_release -sc)_all.deb
		apt-get update
		apt-get install percona-xtrabackup-24
;;
    *)
        echo "Usage: $0 { backup | backup-base | backup-incremental | restore | list | install }"
;;
esac