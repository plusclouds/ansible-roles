Role Name
=========

This role is for mounting the shared directory to the server with nfs.

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

To run this role, you need to have installed the NFS software. If you are going to use NFS for the first time on your server, the playbook should look like this:

    - hosts: nfs-client
      roles:
          - plusclouds.nfs.client
          - plusclouds.nfs.client.mount
      vars:
          - host_ip:                              #Host ip.
          - host_share_path: "/example/path"      #The directory shared by the host.
          - local_mount_path: "/home/plusclouds"  #The directory to connect to the directory shared by the Host. This directory will be created by ansible.

Example Playbook
----------------

If you have already installed NFS software or you have run the plusclouds.nfs.client role and you want to connect the disk to your server, the playbook should look like this:


    - hosts: nfs-client
      roles:
          - plusclouds.nfs.client.mount
      vars:
          - host_ip:                              #Host ip.
          - host_share_path: "/example/path"      #The directory shared by the host.
          - local_mount_path: "/home/plusclouds"  #The directory path shared locally by the host. This directory will be created by ansible.


License
-------

BSD

Author Information
------------------

Emre Aydınsoy

DevOps at PlusClouds

emre.aydinsoy@plusclouds.com
