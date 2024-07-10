@description('The name of the Azure App Service Web App')
param webAppName string

@description('The location in which the Azure App Service Web App will be hosted')
param webAppLocation string

var appServicePlanName = '${webAppName}-asp'

resource webApp 'Microsoft.Web/sites@2022-09-01' = {
  name: webAppName
  location: webAppLocation
  properties: {
    name: webAppName
    serverFarmId: appServicePlan.id
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: appServicePlanName
  location: webAppLocation
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  kind: 'linux'
  properties: {}
}