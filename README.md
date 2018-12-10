# Azure Monitor Route Data

>Note: This sample is for Managed Application in Service Catalog. For Marketplace, please see these instructions:
[**Marketplace Managed Application**](https://docs.microsoft.com/en-us/azure/managed-applications/publish-marketplace-app)

## Deploy this sample to your Service Catalog

### Deploy using Azure Portal

Clicking on the button below, will create the Managed Application definition to a Resource Group in your Azure subscription.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fazuredeploy.json) [![Visualize Deployment](http://armviz.io/visualizebutton.png)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fazuredeploy.json)

<!--- <a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fazuredeploy.json" target="_blank"><img src="http://armviz.io/visualizebutton.png" alt="Visualize Deployment" /></a> -->

Clicking on the button below, will deploy the mainTemplate.json definition to a Resource Group in your Azure subscription.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fsrc%2FmainTemplate.json) [![Visualize Deployment](http://armviz.io/visualizebutton.png)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fsrc%2FmainTemplate.json) [See Deployment UI](https://portal.azure.com/#blade/Microsoft_Azure_Compute/CreateMultiVmWizardBlade/internal_bladeCallId/anything/internal_bladeCallerParams/{"initialData":{},"providerConfig":{"createUiDefinition":"https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fsrc%2FcreateUiDefinition.json"}})

<!--- <a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fsrc%2FmainTemplate.json" target="_blank"><img src="http://armviz.io/visualizebutton.png" alt="Visualize Deployment" /></a> -->

### Deploy using PowerShell

````powershell
$rgname = "<yourRgName>"
$location = "<rgLocation>"
$authorization = "<userOrGroupId>:<RBACRoleDefinitionId>"
$uri = "https://raw.githubusercontent.com/jasoth/AzureMonitorRouteData/master/build/ManagedApplication.zip"

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
  --package-file-uri "https://raw.githubusercontent.com/jasoth/AzureMonitorRouteData/master/build/ManagedApplication.zip"
````
