Örnek Playbook
----------------
    - hosts: all
      become: no
      gather_facts: yes
      roles:
         - plusclouds.database.proxysql.install

Desteklenen Dağıtımlar
-------
* Debian 9.X stretch

Minimum Ansible Versionu
-------
2.1
