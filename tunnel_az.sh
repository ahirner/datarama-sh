#!/bin/bash
rg=$1
vm=$2

key=$rg"_"$vm"_id_rsa"

remote_begin=8889
remote_end=8899
offset_local=1000
ip=$(az vm list-ip-addresses -g $rg -n $vm |  python -c "import json,sys;obj=json.load(sys.stdin);print obj[0]['virtualMachine']['network']['publicIpAddresses'][0]['ipAddress'];")

echo "tunneling ports $remote_begin-$remote_end to +$offset_local locally"
echo "interrupt to close tunnels"
Ls=$(echo $remote_begin-$remote_end | python -c "import sys; p1, p2 = sys.stdin.read().split('-'); print(' '.join(['-L ' + str(p+$offset_local)+':localhost:'+str(p) for p in range(int(p1), int(p2)) ])) ")
ssh -N $Ls $vm@$ip -i ~/.ssh/$key
