#!/bin/bash
AZ_SUBSCRIPTION_ID_DEFAULT=
AZ_RESOURCE_GROUP_DEFAULT=tensorflow101
AZ_REGION_DEFAULT=westeurope

read -p "Azure Subscription ID [$AZ_SUBSCRIPTION_ID_DEFAULT]: " AZ_SUBSCRIPTION_ID
AZ_SUBSCRIPTION_ID=${AZ_SUBSCRIPTION_ID:-$AZ_SUBSCRIPTION_ID_DEFAULT}

read -p "Azure Resource Group [$AZ_RESOURCE_GROUP_DEFAULT]: " AZ_RESOURCE_GROUP
AZ_RESOURCE_GROUP=${AZ_RESOURCE_GROUP:-$AZ_RESOURCE_GROUP_DEFAULT}

read -p "Azure Region [$AZ_REGION_DEFAULT]: " AZ_REGION
AZ_REGION=${AZ_REGION:-$AZ_REGION_DEFAULT}

docker run -d --rm \
    -p 8888:8888 -p 6006:6006 \
    -e "SUBSCRIPTION_ID=$AZ_SUBSCRIPTION_ID" \
    -e "RESOURCE_GROUP=$AZ_RESOURCE_GROUP" \
    -e "WORKSPACE_REGION=$AZ_REGION" \
    --name tensorflow-101 \
    -t bytesmith/tensorflow101