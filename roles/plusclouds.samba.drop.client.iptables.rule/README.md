PlusClouds Add Samba IPTables Settings
=========

It  drop iptables settings for playbook samba and client.

Requirements
------------

None.

Role Variables
--------------

        client_ip: 10.8.0.0                   #ip address of the client to share.



Dependencies
------------

None.


Example Playbook
----------------


    - hosts: samba-clients
      roles:
         - plusclouds.drop.client.iptables.rule
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
