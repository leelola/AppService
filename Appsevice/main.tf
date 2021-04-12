provider "azurerm" {
    features {}
  
}

resource "azurerm_resource_group" "leeskillsrg" {
  name     = var.resource_group_name
  location = var.location
 }

resource "azurerm_app_service_plan" "leeskills-sp" {
    name                = var.app_service_plan_name
    location            = azurerm_resource_group.azurerg.location
    resource_group_name = azurem_resource_group.azurerg.name
    kind                = "Linux"
    reserved = true
    
    sku {
        tier ="Standard"
        size ="S1"
    }
  
}

resource "azurerm_app_service" "leeskillsrg" {
    name                = var.app_service_name
    location            = azurerm_resource_group.leeskillsrg.location
    resource_group_name = azurem_resource_group.leeskillsrg.name
    app_service_plan_id = azurem_app_service_plan.leeskills-sp.id
    
    site_config {
        linux_fx_version = "NODE|12-lts"
    } 
  
}