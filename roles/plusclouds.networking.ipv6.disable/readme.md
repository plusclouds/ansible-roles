Örnek Playbook
----------------
    - hosts: all
      become: no
      gather_facts: yes
      roles:
         - plusclouds.networking.ipv6.disable

Desteklenen Dağıtımlar
-------
* Debian
* Ubuntu
* Redhat
* Centos

Minimum Ansible Versionu
-------
2.1
