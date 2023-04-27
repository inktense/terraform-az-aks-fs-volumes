terraform {
  backend "azurerm" {
    resource_group_name  = "dev"
    storage_account_name = "tfstatestorage2023042786"
    container_name       = "tfstate"
    key                  = "terraform-aks-fs"
  }
}
