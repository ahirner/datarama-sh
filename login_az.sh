#!/bin/bash
rg=$1
vm=$2

key=$rg"_"$vm"_id_rsa"

ip=$(az vm list-ip-addresses -g $rg -n $vm |  python -c "import json,sys;obj=json.load(sys.stdin);print obj[0]['virtualMachine']['network']['publicIpAddresses'][0]['ipAddress'];")

echo "logging in to $ip as $vm"
ssh $vm@$ip -i ~/.ssh/$key

