#!/bin/bash
#define env
export resourceGroup=Demo-RG
subscription="FSO.FHO PID"
location=eastus
AcrName=acrdsc01
AksName=aksdsc01
pathToKubeConfig=~/.kube/config

#Create AKS
az aks create \
    --resource-group $resourceGroup \
    --name $AksName \
    --load-balancer-sku standard \
    --kubernetes-version 1.16.10 \
    --node-vm-size Standard_B2ms \
    --enable-addons monitoring \
    --node-count 1 \
    --generate-ssh-keys \
    --attach-acr $AcrName \
    --verbose

#connect to cluster using kubectl 
az aks get-credentials --resource-group $resourceGroup --name $AksName