#!/bin/bash
rg=$1
vm=$2

key=$rg"_"$vm"_id_rsa"

ip=$(./ip_az.sh $rg $vm)

echo "logging in to $ip as $vm"
ssh $vm@$ip -i ~/.ssh/$key
