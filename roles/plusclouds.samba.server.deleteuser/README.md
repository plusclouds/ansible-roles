PlusClouds Delete Samba User
=========

This role delete linux user.

Requirements
------------

None.

Role Variables
--------------

          samba_users:          
            - name: 'plusclouds'                #The name of the user whose directory sharing will be stopped.

Dependencies
------------

None.


Example Playbook
----------------

    - hosts: samba-servers
      roles:
         - plusclouds.samba.server.deleteuser

      vars:
         - samba_users:
           - name: 'foouser'
             smbpasswd: 'pass123'

License
-------

BSD

Author Information
------------------

Emre Aydınsoy

DevOps at PlusClouds

emre.aydinsoy@plusclouds.com
