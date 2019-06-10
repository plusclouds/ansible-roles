Örnek Playbook
----------------
    - hosts: all
      become: true
      roles:
         - plusclouds.nginx-ssl-waf

Desteklenen Dağıtımlar
-------
* Debian tabanli hepsi.

Minimum Ansible Versionu
-------
2
