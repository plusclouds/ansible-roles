Role Name
=========

This role is for mounting the shared directory to the server with samba.

Requirements
------------

None.

Role Variables
--------------

Available variables are listed below, along with default values (see defaults/main.yml):

    host_ip: 10.8.1.90                             #Sharing server ip address
    local_mount_path: /home/example-path           #directory to mount.
    sharing_path_name: public                      #The name of the directory that is being shared.

    samba_user: "plusclouds"                       #The name of the shared user.
    samba_user_pass: "pass123"                     #The password of the shared user.


Dependencies
------------

To run this role, you need to have installed the samba software. If you are going to use Samba for the first time on your server, the playbook should look like this:

     - hosts: samba-client
       roles:
         - plusclouds.samba.client
         - plusclouds.samba.client.mount
       vars:
         - host_ip: 10.8.0.183                                 #Sharing server ip address
         - local_mount_path: /home/example-path                #Directory to mount.
         - sharing_path_name: deneme3                          #The name of the directory that is being shared.
         - samba_user: "Example"                               #The name of the shared user.
         - samba_user_pass: "pass123"                          #The password of the shared user.

Example Playbook
----------------

If you have already installed Samba software or you have run the plusclouds.samba.client role and you want to connect the disk to your server, the playbook should look like this:


     - hosts: samba-client
       roles:
         - plusclouds.samba.client.mount
       vars:
         - host_ip: 10.8.0.183                                 #Sharing server ip address
         - local_mount_path: /home/example-path                #Directory to mount.
         - sharing_path_name: deneme3                          #The name of the directory that is being shared.
         - samba_user: "Example"                               #The name of the shared user.
         - samba_user_pass: "pass123"                          #The password of the shared user.


License
-------

BSD

Author Information
------------------

Emre Aydınsoy

DevOps at PlusClouds

emre.aydinsoy@plusclouds.com
