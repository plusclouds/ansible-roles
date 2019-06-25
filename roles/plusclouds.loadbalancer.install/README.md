Örnek Playbook
----------------
    - hosts: all
      become: true
      roles:
         - plusclouds.nginx-loadbalancer

Desteklenen Dağıtımlar
-------
* Debian tabanli hepsi.

Minimum Ansible Versionu
-------
2
