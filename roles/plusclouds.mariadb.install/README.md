Örnek Playbook
----------------
    - hosts: all
      become: true
      roles:
         - plusclouds.mariadb-install

Desteklenen Dağıtımlar
-------
* Ubuntu 14.04 trusty
* Ubuntu 16.04 xenial
* Debian 7 Wheezy
* Debian 8 Jessie

Minimum Ansible Versionu
-------
2.1
