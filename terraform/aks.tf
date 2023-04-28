resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  location            = var.az_location
  resource_group_name = var.az_resource_group_name

    dns_prefix = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Develop"
  }
}