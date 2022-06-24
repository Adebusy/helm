provider "azurerm" {
  version = "~>1.32.0"
  #use_msi =true
  #tenant_id ="79543c3e-560a-4b69-ad1b-7fd4516168e8"
  #subscription_id ="3e6c4ee8-00ee-4546-b190-772547d3a510"
}

resource "azurerm_key_vault" "name" {
  module "keyvault" {
    source  = "claranet/keyvault/azurerm"
    version = "4.4.0"
    # insert the 10 required variables here
    name                = var.resourceName
    location            = var.location
    client_name         = var.client_name
    environment         = var.environment
    stack               = var.stack
    resource_group_name = var.resourceGroup
  }
}

output "name" {
  value = azurerm_key_vault.name
}
