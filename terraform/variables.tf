variable "az_location" {
    description = "The Azure Region in which all resources in this example should be created."
    default     = "ukwest"
}

variable "az_resource_group_name" {
    description = "The name of the Azure Resource Group in which all resources in this example should be created."
    default     = "dev"
}

variable "cluster_name" {
    description = "The name of the AKS cluster."
    default     = "aks-fs"
}

variable "dns_prefix" {
    description = "The DNS prefix to use with the AKS cluster."
    default     = "aks-fs"
}