PlusClouds Share Path/Disc with NFS
=========

This role is to enable directory sharing with NFS.


Requirements
------------

None.


Role Variables
--------------

          local_share_path: "/mnt/nfs"      # The directory you want to share.

          client_ip: "10.8.0.254"           # The client ip address to be directory-shared.      


Dependencies
------------

To run this role, you need to have installed the NFS software. If you are going to use NFS for the first time on your server, the playbook should look like this:

    - hosts: nfs-server
      roles:
          - plusclouds.nfs.server
          - plusclouds.nfs.server.mount
      vars:
          - client_ip: "10.8.0.254"           # The client ip address to be directory-shared.
          - local_share_path: "/mnt/nfs"      # The directory you want to share.


Example Playbook
----------------

If you have already installed the NFS software, or if you runned the plusclouds.nfs.server role and want to share your disk, the playbook should look like this:



    - hosts: nfs-server
      roles:
          - plusclouds.nfs.server.mount
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
