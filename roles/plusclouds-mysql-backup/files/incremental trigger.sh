#!/bin/bash

# Installing mysql  #ANSIBLE ILE YUKLENECEK
apt-get update
apt-get install mysql-server

# Setting variables 
SCRIPT_PATH="/home/scrpits"
SCRIPT=$SCRIPT_PATH/incremental-mysql-backup.sh

# Taking paramaters # ANSIBLE ILE ALINACAK
POSITIONAL=()
while [[ $# -gt 0 ]
]do
key="$1"

case $key in
    -u|--mysql-username)
    USERNAME="$2"
    shift # past argument
    shift # past value
    ;;
    -p|--password)
    PASSWORD="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}"

#Createating script file directory.
mkdir $SCRIPT_PATH

#Setting up Cronjob for incremental backup
touch $SCRIPT_PATH/cronjob
echo "0 2 * * * bash $SCRIPT backup" > $SCRIPT_PATH/cronjob
crontab $SCRIPT_PATH/cronjob

#Downloading incremental backup script # ANSIBLE ILE INDIRILECEK
wget https://raw.githubusercontent.com/dereliahmet1/scripts/dereliahmet1/incremental-mysql-backup.sh
mv incremental-mysql-backup.sh $SCRIPT_PATH

#Changing mysql user and password.

cat $SCRIPT | sed 's/'"root"'/'"$USERNAME"'/'
cat $SCRIPT | sed 's/'"123"'/'"$PASSWORD"'/'

#Giving permissions
chmod 777 $SCRIPT

#Running backup script
bash $SCRIPT install
bash $SCRIPT backup
bash $SCRIPT list