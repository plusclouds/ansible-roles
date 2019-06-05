Role Name
=========

A brief description of the role goes here.

Requirements
------------
none

Role Variables
--------------

vm_uuid: #VM UUID
force: false # Force VM to shutdown and start
set_memory: 1024 #Set memory limits
size: MiB #Set size GiB or MiB, default MiB

Dependencies
------------

Xen v6-7 All works

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------
Ahmet Faruk Dereli
Senior Automation Engineer & DevOps Team Leader @Plusclouds
ahmet.dereli@plusclouds.com