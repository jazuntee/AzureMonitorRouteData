# Azure Monitor Route Data

>Note: Managed Applications can be published to a [Service Catalog](https://docs.microsoft.com/en-us/azure/managed-applications/publish-service-catalog-app) or the [Azure Marketplace](https://docs.microsoft.com/en-us/azure/managed-applications/publish-marketplace-app).


## Deploy to Service Catalog

### Deploy using Azure Portal
Click "Deploy to Azure" to deploy the Managed Application Definition to a Resource Group in your Azure Subscription.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fazuredeploy.json) [![Visualize Deployment](http://armviz.io/visualizebutton.png)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fazuredeploy.json) [See Deployment UI](https://portal.azure.com/#blade/Microsoft_Azure_Compute/CreateMultiVmWizardBlade/internal_bladeCallId/anything/internal_bladeCallerParams/{"initialData":{},"providerConfig":{"createUiDefinition":"https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fsrc%2FcreateUiDefinition.json"}})

### Deploy using PowerShell
Replace `<ParameterValues>` and execute command(s) to deploy the Managed Application Definition to a Resource Group in your Azure Subscription.

```powershell
New-AzureRmManagedApplicationDefinition -Name "<ManagedAppName>" `
                                        -ResourceGroupName "<ResourceGroupName>" `
                                        -DisplayName "<ManagedAppDisplayName>" `
                                        -Description "<ManagedAppDescription>" `
                                        -Location "<ManagedAppLocation>" `
                                        -LockLevel ReadOnly `
                                        -Authorization "<userOrGroupId>:<RBACRoleDefinitionId>" `
                                        -PackageFileUri "https://raw.githubusercontent.com/jasoth/AzureMonitorRouteData/master/build/ManagedApplication.zip" `
                                        -Verbose
```

### Deploy using Azure CLI
Replace `<ParameterValues>` and execute command(s) to deploy the Managed Application Definition to a Resource Group in your Azure Subscription.

```
az managedapp definition create \
  --name "<ManagedAppName>" \
  --resource-group <ResourceGroupName> \
  --display-name "<ManagedAppDisplayName>" \
  --description "<ManagedAppDescription>" \
  --location <ManagedAppLocation> \
  --lock-level ReadOnly \
  --authorizations "<userOrGroupId>:<RBACRoleDefinitionId>" \
  --package-file-uri "https://raw.githubusercontent.com/jasoth/AzureMonitorRouteData/master/build/ManagedApplication.zip"
```


## Deploy Content (mainTemplate.json) without Managed Application

### Deploy using Azure Portal
Click "Deploy to Azure" to deploy content (mainTemplate.json) without Managed Application to a Resource Group in your Azure subscription.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fsrc%2FmainTemplate.json) [![Visualize Deployment](http://armviz.io/visualizebutton.png)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fjasoth%2FAzureMonitorRouteData%2Fmaster%2Fsrc%2FmainTemplate.json)

### Deploy using PowerShell
Replace `<ParameterValues>` and execute command(s) to deploy content (mainTemplate.json) without Managed Application to a Resource Group in your Azure subscription.

```powershell
New-AzureRmResourceGroup -Name "<ResourceGroupName>" -Location "<Location>"
New-AzureRmResourceGroupDeployment -ResourceGroupName "<ResourceGroupName>" `
                                   -TemplateUri "https://raw.githubusercontent.com/jasoth/AzureMonitorRouteData/master/src/mainTemplate.json" `
                                   -TemplateParameterUri "https://raw.githubusercontent.com/jasoth/AzureMonitorRouteData/master/src/mainTemplate.parameters.json"
```

### Deploy using Azure CLI
Replace `<ParameterValues>` and execute command(s) to deploy content (mainTemplate.json) without Managed Application to a Resource Group in your Azure subscription.

```
az group create --name "<ResourceGroupName>" --location "<Location>"
az group deployment create \
  --resource-group ExampleGroup \
  --template-uri "https://raw.githubusercontent.com/jasoth/AzureMonitorRouteData/master/src/mainTemplate.json" \
  --parameters StorageAcctName=<StorageAccountName> \
  --parameters EventHubNamespace=<EventHubNamespaceName> \
  --parameters LogAnalyticsWorkspaceName=<LogAnalyticsWorkspaceName>
```
