PlusClouds NFS umount Path
=========

This role unmounts the disk that you connect to your server with NFS and removes the settings from the /etc/fstab file.


Requirements
------------

None.

Role Variables
--------------

Available variables are listed below, along with default values (see defaults/main.yml):

    host_ip:                              #Host ip.

    host_share_path: "/example/path"      #The directory shared by the host.

    local_mount_path: "/home/plusclouds"  #The directory to connect to the directory shared by the Host. This directory will be created by ansible.


Dependencies
------------

None.

Example Playbook
----------------


    - hosts: nfs-client
      roles:
          - plusclouds.nfs.client.umount
      vars:
          - host_ip:                              #Host ip.
          - host_share_path: "/example/path"      #The directory shared by the host.
          - local_mount_path: "/home/plusclouds"  #The directory to connect to the directory shared by the Host. This directory will be created by ansible.

License
-------

BSD

Author Information
------------------

Emre Aydınsoy

DevOps at PlusClouds

emre.aydinsoy@plusclouds.com
