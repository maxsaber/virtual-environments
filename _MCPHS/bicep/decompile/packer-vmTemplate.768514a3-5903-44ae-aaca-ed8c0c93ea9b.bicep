@description('Specifies the location for resources.')
param location string = 'eastus'

param vmName string
param vmSize string = 'Standard_D2as_v4'
param adminUserName string

@secure()
param adminPassword string
param networkInterfaceId string

resource vmName_resource 'Microsoft.Compute/virtualMachines@2021-11-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    storageProfile: {
      osDisk: {
        osType: 'Windows'
        name: 'packer-osDisk.768514a3-5903-44ae-aaca-ed8c0c93ea9b.vhd'
        createOption: 'FromImage'
        image: {
          uri: 'https://rgpackerbuild001.blob.core.windows.net/system/Microsoft.Compute/Images/images/packer-osDisk.768514a3-5903-44ae-aaca-ed8c0c93ea9b.vhd'
        }
        vhd: {
          uri: 'https://rgpackerbuild001.blob.core.windows.net/vmcontainer9fb27afe-daf5-4dfb-ac48-0b6273b888d8/osDisk.9fb27afe-daf5-4dfb-ac48-0b6273b888d8.vhd'
        }
        caching: 'ReadWrite'
      }
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUserName
      adminPassword: adminPassword
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaceId
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: false
      }
    }
    provisioningState: 0
  }
}
