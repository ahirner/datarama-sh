#!/bin/bash

rg=$1
vm=$2

key=$rg"_"$vm"_id_rsa"
echo "creating key $key"
ssh-keygen -f ~/.ssh/$key -t rsa -b 2048 -C '' -N ''

pub=$key".pub"
az vm create --resource-group $rg --name $vm --image Canonical:UbuntuServer:16.04-LTS:latest --size Standard_NC6 --admin-username $vm --ssh-key-value ~/.ssh/$pub

echo "opening ports 8889-8899"
az vm open-port --port 8889-8899 -g $rg -n $vm

