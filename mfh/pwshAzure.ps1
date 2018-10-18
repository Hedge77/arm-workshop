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
