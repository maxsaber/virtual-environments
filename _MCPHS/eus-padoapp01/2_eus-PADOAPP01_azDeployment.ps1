# Create Azure VM NIC
az network nic create -g "rgEastUS" -l $"EastUS" -n "eus-padoapp01432" --vnet-name "tomCLOUD" --subnet "subAppEUs" --subscription {0805677a-fb2c-426d-aacf-2f55ec066d53}

# Get NIC object ID
$networkId = (Get-AzNetworkInterface -name "eus-padoapp01432").NewNIC.id

# Deploy VM from template JSON file
az deployment group create -g "rgEastUS" -n "eus-PADOAPP01" --subscription "0805677a-fb2c-426d-aacf-2f55ec066d53" --template-file "C:\virtual-environments\_MCPHS\packer-vmTemplate.768514a3-5903-44ae-aaca-ed8c0c93ea9b.json" --parameters vmSize="Standard_D2as_v4" vmName="eus-PADOAPP01" adminUserName="jagermeister" adminPassword="Syst3mC0nfig1!" networkInterfaceId="/subscriptions/0805677a-fb2c-426d-aacf-2f55ec066d53/resourceGroups/rgEastUS/providers/Microsoft.Network/networkInterfaces/eus-tadoapp01432"