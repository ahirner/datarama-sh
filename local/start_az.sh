#!/bin/bash
rg=$1
vm=$2

az vm start --resource-group $rg --name $vm
