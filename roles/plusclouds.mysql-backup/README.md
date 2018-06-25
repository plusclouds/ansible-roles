Örnek Playbook
----------------
    - hosts: all
      become: true
      roles:
         - plusclouds.mysql-backup

Desteklenen Dağıtımlar
-------
* Ubuntu 14.04 trusty

Minimum Ansible Versionu
-------
2.1
