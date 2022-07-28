# https://docs.microsoft.com/en-us/azure/virtual-machines/windows/convert-unmanaged-to-managed-disks

# Convert unmanaged Azure VM disks

Function Convert-UnmanagedAzureVmDisks {
    <#
        .SYNOPSIS
            A helper function to update an Azure VM's disks to managed.

        .PARAMETER rgName
            The Azure resource group name where the Azure virtual machine will be created.

        .PARAMETER vmName
            The name of the virtual machine to be generated.

        .EXAMPLE
            Convert-UnmanagedAzureVmDisks -ResourceGroupName "rgEastUS" -vmName "eus-TADOAPP02"
    #>
    param (
        [Parameter(Mandatory = $True)]
        [string] $rgName,
        [Parameter(Mandatory = $True)]
        [string] $vmName
    )

$rgName = "rgEastUS"
$vmName = Read-Host 'VM name (include eus-)'
Stop-AzVM -ResourceGroupName $rgName -Name $vmName -Force
ConvertTo-AzVMManagedDisk -ResourceGroupName $rgName -VMName $vmName

}