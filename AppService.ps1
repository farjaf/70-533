# Define properties
$resourceGroupName = "contoso"
$appServicePlanName = "contoso"
$location = "West US"
$tier = "Premium"
$workerSize = "small"
# Create a new resource group
New-AzureRmResourceGroup -Name $resourceGroupName -location $location
#Create a new app service plan
New-AzureRmAppServicePlan -ResourceGroupName $resourceGroupName -Name $appServicePlanName -Location $location -Tier $tier -WorkerSize $workerSize

##########################    Create a WebApp   ############################
$resourceGroupName = "contoso"
$appServicePlanName = "contoso"
$location = "West US"
$webAppName = "contoso-hr-app"
#create a new web app
New-AzureRmWebApp -ResourceGroupName $resourceGroupName -Location $location -AppServicePlan $appServicePlanName -Name $webAppName

########################## Create a deployment slot  ##########################
$resourceGroupName = "contoso"
$webAppName = "contoso-hr-app"
$stagingSlotName = "Staging"
#Create a new web app deployment slot
New-AzureRmWebAppSlot -ResourceGroupName $resourceGroupName - Name $webAppName -Slot $stagingSlotName
##########################clone Existing slot ##########################
$resourceGroupName = "contoso"
$appServicePlanName = "contoso"
$webAppName = "contoso-hr-app"
$stagingSlotName = "Staging"
$productionSlotName = "Production"
#Get a reference to the production deployment slot
$productionSite = Get-AzureRmWebAppSlot -ResourceGroupName $resourceGroupName -Name $webAppName -Slot $productionSlotName
# Create a deployment slot that clones the production deployment slot settings
New-AzureRmWebAppSlot -ResourceGroupName $resourceGroupName -Name $webAppName -Slot $stagingSlotName -AppServicePlan $appServicePlanName -SourceWebApp $productionSite

