Örnek Playbook
----------------
    - hosts: all
      become: true
      roles:
         - plusclouds.fail2ban-install

Desteklenen Dağıtımlar
-------
* Debian tabanli hepsi.
* RedHat tabanli hepsi.

Minimum Ansible Versionu
-------
2.1
