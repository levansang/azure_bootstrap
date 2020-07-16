#!/bin/bash
#define env
export resourceGroup=Demo-RG
subscription="FSO.FHO PID"
location=eastus
AcrName=acrdsc01
pathToKubeConfig=~/.kube/config
#create resource group
CK=`az group exists -n $resourceGroup`
if [ $CK == "false" ]
then
    az group create --name $resourceGroup --location $location --subscription "FSO.FHO PID"
else 
    echo "$resourceGroup was existed"
fi

#create ACR
az acr create --resource-group $resourceGroup --name $AcrName --sku Basic --subscription "FSO.FHO PID" --location $location

#login to ACR
az acr login --name $AcrName

