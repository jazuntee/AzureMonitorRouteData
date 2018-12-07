# AzureMonitorRouteData

>Note: This sample is for Managed Application in Service Catalog. For Marketplace, please see these instructions:
[**Marketplace Managed Application**](https://docs.microsoft.com/en-us/azure/managed-applications/publish-marketplace-app)

## Deploy this sample to your Service Catalog

### Deploy using Azure Portal

Clicking on the button below, will create the Managed Application definition to a Resource Group in your Azure subscription.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fazuredeploy.json)

[![Visualize Deployment](http://armviz.io/visualizebutton.png)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fazuredeploy.json)

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fazuredeploy.json" target="_blank"><img href="http://armviz.io/visualizebutton.png" /></a>

Clicking on the button below, will deploy the mainTemplate.json definition to a Resource Group in your Azure subscription.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2FmainTemplate.json)

[![Visualize Deployment](http://armviz.io/visualizebutton.png)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2FmainTemplate.json)

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2FmainTemplate.json" target="_blank"><img href="http://armviz.io/visualizebutton.png" /></a>

### Deploy using PowerShell

````powershell
$rgname = "<yourRgName>"
$location = "<rgLocation>"
$authorization = "<userOrGroupId>:<RBACRoleDefinitionId>"
$uri = "https://raw.githubusercontent.com/Azure/azure-managedapp-samples/master/samples/201-managed-storage-account/managedstorage.zip"

New-AzureRmManagedApplicationDefinition -Name "ManagedStorage" `
                                        -ResourceGroupName $rgname `
                                        -DisplayName "Managed Storage Account" `
                                        -Description "Managed Azure Storage Account" `
                                        -Location $location `
                                        -LockLevel ReadOnly `
                                        -PackageFileUri $uri `
                                        -Authorization $authorization `
                                        -Verbose
````

### Deploy using AzureCLI

Modify the snippet below to deploy Managed Application definition to a Resource Group in your Azure subscription

````azureCLI
az managedapp definition create \
  --name "ManagedStorage" \
  --location <rgLocation> \
  --resource-group <yourRgName> \
  --lock-level ReadOnly \
  --display-name "Managed Storage Account" \
  --description "Managed Azure Storage Account" \
  --authorizations "<userOrGroupId>:<RBACRoleDefinitionId>" \
  --package-file-uri "https://raw.githubusercontent.com/Azure/azure-managedapp-samples/master/samples/201-managed-storage-account/managedstorage.zip"
````
