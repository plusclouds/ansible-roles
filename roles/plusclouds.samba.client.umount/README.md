Role Name
=========

This role unmounts the disk that you connect to your server with Samba and removes the settings from the /etc/fstab file.

Requirements
------------

None.

Role Variables
--------------

Available variables are listed below, along with default values (see defaults/main.yml):

    host_ip: 10.8.0.0                              #Sharing server ip address
    local_mount_path: /home/example-path           #directory to mount.
    sharing_path_name: public                      #The name of the directory that is being shared.


Dependencies
------------

None.

Example Playbook
----------------


     - hosts: samba-client
       roles:
         - plusclouds.samba.client.umount
       vars:
         - host_ip: 10.8.0.0                                   #Sharing server ip address
         - local_mount_path: /home/example-path                #Directory to mount.
         - sharing_path_name: example-name                     #The name of the directory that is being shared.


License
-------

BSD

Author Information
------------------

Emre Aydınsoy

DevOps at PlusClouds

emre.aydinsoy@plusclouds.com
