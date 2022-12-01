Set-Location C:\Users\max.saber.MCPHS\git\virtual-environments
Import-Module .\helpers\GenerateResourcesAndImage.ps1

#   SubscriptionId                  {0805677a-fb2c-426d-aacf-2f55ec066d53}
#       Azure subscription Id where resources will be created
#   ResourceGroupName               rgPackerBuild
#       Azure resource group name where the Azure resources will be created
#   ImageGenerationRepositoryRoot   $pwd
#       Root path of the image generation repository source
#   ImageType                       Windows2022
#       The type of the image being generated
#   AzureLocation                   East US
#       The location of the resources being created in Azure

GenerateResourcesAndImage -SubscriptionId {0805677a-fb2c-426d-aacf-2f55ec066d53} -ResourceGroupName "rgPackerBuild" -ImageGenerationRepositoryRoot "$pwd" -ImageType "Windows2022" -AzureLocation "East US"
