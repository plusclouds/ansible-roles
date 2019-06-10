PlusClouds NFS Disable
=========

This role is to disable directory sharing with NFS.


Requirements
------------

None.


Role Variables
--------------

      client_ip: "10.8.0.254"           # The IP address of the directory shared client.

      local_share_path: "/mnt/nfs"      # The directory you want to close to the share.


Dependencies
------------

None.



Example Playbook
----------------

    - hosts: nfs-server
      roles:
          - plusclouds.nfs.server.umount
      vars:
          - client_ip: "10.8.0.254"           # The client ip address to be directory-shared.
          - local_share_path: "/mnt/nfs"      # The directory you want to share.





License
-------

BSD

Author Information
------------------

Emre Aydınsoy

DevOps at PlusClouds

emre.aydinsoy@plusclouds.com
