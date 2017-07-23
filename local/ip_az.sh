#!/bin/bash
rg=$1
vm=$2

ip=$(az vm list-ip-addresses -g $rg -n $vm --output table | grep $vm | awk -v I=2 '{print $I}')

echo "$ip"

