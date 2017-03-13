#!/bin/bash
rg=$1
vm=$2

az vm deallocate --resource-group $rg --name $vm
