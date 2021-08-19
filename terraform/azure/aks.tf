resource azurerm_kubernetes_cluster "k8s_cluster" {
  dns_prefix          = "terragoat-${var.environment}"
  location            = var.location
  name                = "terragoat-aks-${var.environment}"
  resource_group_name = azurerm_resource_group.example.name
  identity {
    type = "SystemAssigned"
  }
  default_node_pool {
    name       = "default"
    vm_size    = "Standard_D2_v2"
    node_count = 2
  }
  addon_profile {
    oms_agent {
      enabled = false
    }
    kube_dashboard {
      enabled = true
    }
  }
  role_based_access_control {
    enabled = false
  }
  tags = {
    git_commit           = "5b403ea072f7e71c052a7431d21c59b705d2ca2d"
    git_file             = "terraform/azure/aks.tf"
    git_last_modified_at = "2021-08-19 12:44:42"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "eurogig"
    git_repo             = "disgoat"
    level                = "development"
    team                 = "seceng"
    yor_trace            = "35625376-2e62-42b3-9f3c-64878029e924"
  }
}