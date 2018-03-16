Örnek Playbook
----------------
    - hosts: all
      become: true
      roles:
         - plusclouds.fail2ban_fix

Desteklenen Dağıtımlar
-------
* Centos 6
* Centos 7

Minimum Ansible Versionu
-------
2.1
