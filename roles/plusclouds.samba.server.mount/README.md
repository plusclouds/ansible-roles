Role Name
=========

This role is for sharing the local directory through samba.


Requirements
------------

None.

Role Variables
--------------

Available variables are listed below, along with default values (see defaults/main.yml):

         share_name: foo-name                                   #Private paylasılacak dosya ismi/acıklaması
         share_path: /foo/path                                  #Name/description of the directory to share.

         samba_group_name: smbgrp
         samba_users:
         - name: 'fooplus'                                      #The name of the directory shared user.
           smbpasswd: 'pass123'                                 #The password of the directory shared user.


         client_ip: 10.8.0.254

         readonly: true


Dependencies
------------

To run this role, you need to have installed the samba software. If you are going to use Samba for the first time on your server, the playbook should look like this:

     - hosts: samba-server
       roles:
         - plusclouds.samba.server
         - plusclouds.samba.server.mount
       vars:
         - samba_group_name: denemegrup
         - samba_users:
           - name: 'denemeuser'                               #The name of the shared user.
             smbpasswd: 'pass123'                             #The password of the shared user.
         - share_name: deneme1                                #Directory to share.
         - share_path: /home/deneme                           #Directory to mount.
         - client_ip: 10.8.0.0                                #Sharing server ip address
         - readonly: false                                    #The default parameter allows you to writable.
                                                              #When the False parameter is received, the user is authorized to read the file.

Example Playbook
----------------

If you have already installed Samba software or you have run the plusclouds.samba.client role and you want to connect the disk to your server, the playbook should look like this:


     - hosts: samba-server
       roles:
         - plusclouds.samba.server
         - plusclouds.samba.server.adduser
         - plusclouds.samba.server.mount
         - plusclouds.samba.add.client.iptables.rule
       vars:
         - samba_group_name: denemegrup
         - samba_users:
           - name: 'denemeuser'                               #The name of the shared user.
             smbpasswd: 'pass123'                             #The password of the shared user.
         - share_name: deneme1                                #Directory to share.
         - share_path: /home/deneme                           #Directory to mount.
         - client_ip: 10.8.0.0                                #Sharing server ip address
         - readonly: false                                    #The default parameter allows you to writable.
                                                              #When the False parameter is received, the user is authorized to read the file.




License
-------

BSD

Author Information
------------------

Emre Aydınsoy

DevOps at PlusClouds

emre.aydinsoy@plusclouds.com
