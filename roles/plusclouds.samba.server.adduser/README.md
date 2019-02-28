PlusClouds Add Samba User
=========

This role add linux user.

Requirements
------------

None.

Role Variables
--------------

          samba_group_name: smbgrp              #The name of the group to be directory-shared.       
          samba_users:          
            - name: 'plusclouds'                #The name of the user to be directory-shared.
              smbpasswd: 'pass123'              #The password of the user to be directory-shared.


Dependencies
------------

None.


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: samba-servers
      roles:
         - plusclouds.samba.server.adduser

License
-------

BSD

Author Information
------------------

Emre Aydınsoy

DevOps at PlusClouds

emre.aydinsoy@plusclouds.com
