# Install Azure module
$PSVersionTable.PSVersion
# Install Azure module for powershell core
install-module Az -AllowClobber
# Import the module into the PowerShell session
Import-Module Az
# Enable AzureRM aliases for the user
Enable-AzureRmAlias -Scope CurrentUser
#
install-module Azure -Force
import-module Azure
Import-Module "C:\Program Files (x86)\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Azure.psd1"
# Login in to Azure
Login-AzureRMAccount

#test script
$rg="lab1"
$job="job3"
$sa="mfhsa0001"
$template="azuredeploy.json"
New-AzureRMResourceGroupDeployment -name $job -storageaccount $sa -templateFile $template -ResourceGroup $rg

#testing template validity
Test-AzureRMResourceGroupDeployment -name $job -storageaccount $sa -templateFile $template -ResourceGroup $rg
New-AzureRMResourceGroupDeployment -TemplateFile .\azuredeploy.json -ResourceGroupName $rg -Name $job

#new
$rg="lab1"
$job='job.'+((Get-Date).ToUniversalTime()).ToString("MMddyy.HHmm")
$template="azuredeploy.json"
$saPrefix = "mfhsa"
$storageAccount = (New-AzureRMResourceGroupDeployment -Name $job -StorageAccountPrefix $saPrefix -TemplateFile $template -ResourceGroupName $rg ).Output
echo $storageAccount
