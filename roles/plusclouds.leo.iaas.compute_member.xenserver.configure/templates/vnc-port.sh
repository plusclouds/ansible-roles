#!/bin/bash

vm=$1

domId=$(xe vm-list params=dom-id uuid=${vm} --minimal)
port=$(xenstore-read /local/domain/${domId}/console/vnc-port)

echo $port
