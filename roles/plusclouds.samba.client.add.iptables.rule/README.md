PlusClouds Add Samba IPTables Settings
=========

It adds iptables settings for playbook samba.

Requirements
------------

None.

Role Variables
--------------

None.


Dependencies
------------

None.


Example Playbook
----------------


    - hosts: samba-clients
      roles:
         - plusclouds.add.client.iptables.rule
       vars:
         - client_ip: 10.8.0.0                   #ip address of the client to share.





License
-------

BSD

Author Information
------------------

Emre Aydınsoy

DevOps at PlusClouds

emre.aydinsoy@plusclouds.com
