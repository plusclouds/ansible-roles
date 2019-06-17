#!/bin/bash

vm=$1

domId=$(xe vm-list params=dom-id uuid=${vm} --minimal)
port=$(xenstore-read /local/domain/${domId}/console/vnc-port)

echo $port
root@repo:/home/imageuser/image/plusclouds# cat vnc-access.sh 
#!/bin/bash

if [[ $# -ne 1 ]]; then
        echo " You need to provide a vm name."
        exit 1
fi

vmname=$1

xe vm-list params=name-label name-label=${vmname} | grep " name-label.*: ${vmname}$" > /dev/null

status=$?

#if [[ $status -ne 0 ]]; then
#       echo " ${vmname} is not a valid vm."
#exit
#fi

resident_uuid=$(xe vm-list params=resident-on name-label=${vmname} --minimal)

domid=$(xe vm-list params=dom-id name-label=${vmname} --minimal)

vncport=$(xenstore-read /local/domain/${domid}/console/vnc-port)

resident_ip=$(xe pif-list management=true params=IP host-uuid=${resident_uuid} --minimal)

echo " Resident IP: ${resident_ip}"
echo " VNC Port: ${vncport}"
echo " "
echo " Run the following command from your local PC to connect to the 
server using ssh and connect with a VNC client to localhost:${vncport}

ssh -L ${vncport}:localhost:${vncport} root@${resident_ip}"