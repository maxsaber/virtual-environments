# https://github.com/actions/virtual-environments/blob/main/docs/create-image-and-azure-resources.md

# Install Choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Check Choco install
choco -?

# Install Packer
choco install packer

# Install Git
choco install git -params '"/GitAndUnixToolsOnPath"'

# Install Azure Az PowerShell Modules
Install-Module -Name Az -Repository PSGallery -Force

# Install Azure CLI
Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

# Clone virtual-environments repo
Set-Location c:\
git clone https://github.com/actions/virtual-environments.git

# Generate image VHD
Set-Location C:\virtual-environments
Import-Module .\helpers\GenerateResourcesAndImage.ps1

<#
Subscription ID:        The Azure subscription Id where resources will be created.
    0805677a-fb2c-426d-aacf-2f55ec066d53
Resource Group Name:    The Azure resource group name where the Azure resources will be created.
    "rgPackerBuild" <<<<<<< ** DO NOT USE PROD RESOURCE GROUP **
Image Gen Repo Root:    The root path of the image generation repository source.
    "C:\virtual-environments"
Image Type:             The type of the image being generated. Valid options are: {"Windows2016", "Windows2019", "Windows2022", "Ubuntu1804", "Ubuntu2004"}.
   "Windows2022"
Azure Location:         The location of the resources being created in Azure. For example "East US".
    "East US"
Tags:                   A hashtable containing any tags to be assigned to the 
    @{dept="devops";env="prod"}

    GenerateResourcesAndImage -SubscriptionId {0805677a-fb2c-426d-aacf-2f55ec066d53} -ResourceGroupName "rgPackerBuild" -ImageGenerationRepositoryRoot "$pwd" -ImageType "Windows2022" -AzureLocation "East US"

#>

GenerateResourcesAndImage -SubscriptionId {0805677a-fb2c-426d-aacf-2f55ec066d53} -ResourceGroupName "rgPackerBuild" -ImageGenerationRepositoryRoot "$pwd" -ImageType "Windows2022" -AzureLocation "East US"

GenerateResourcesAndImage -SubscriptionId {0805677a-fb2c-426d-aacf-2f55ec066d53} -ResourceGroupName "rgPackerBuild" -ImageGenerationRepositoryRoot "$pwd" -ImageType "Windows2019" -AzureLocation "East US"