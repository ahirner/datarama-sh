#!/bin/bash

rg=$1
vm=$2

key=$rg"_"$vm"_id_rsa"
echo "creating key $key"
ssh-keygen -f ~/.ssh/$key -t rsa -b 2048 -C '' -N ''

pub=$key".pub"
az vm create --storage-sku Standard_LRS\
             --resource-group $rg --name $vm\
             --image Canonical:UbuntuServer:16.04-LTS:latest --size Basic_A1\
             --admin-username $vm --ssh-key-value ~/.ssh/$pub\
             --public-ip-address-dns-name $vm_$rg

echo "opening ports 8889-8899 and 5000-5999"
az vm open-port --port 8889-8899 -g $rg -n $vm
az vm open-port --port 5000-5999 -g $rg -n $vm

