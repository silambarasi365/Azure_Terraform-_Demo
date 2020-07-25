provider "azurerm" {
  # config the microsoft azure provider
  version = "=2.20.0"
  features {}
  subscription_id = "eff30bdb-f0de-429e-b1be-386d8254f27e"
  client_id       = "dd021d36-ae41-4e9c-8e87-9644fe814616"
  client_secret   = "EcptOGmJAoH~I1dTzxhlwzsV5.Mp_16gtY"
  tenant_id       = "13a19503-222a-4a81-b48a-a4c1d66a1fb2"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "Azure-Devops"
    storage_account_name = "samplestoarge"
    container_name       = "tfstate"
    key                  = "state.terraform.tfstate"
  }
}

locals {
  envirnonment_name = "Development"
  owner        = "silambarasi"
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    envirnonment = local.envirnonment_name
    Owner   = local.owner
  }
}
#create a resource group if it doesn't exit
resource "azurerm_resource_group" "Test" {
  name     = var.resourcegroupname
  location = var.location
  tags = local.common_tags
}
