resource "azurerm_virtual_network" "example" {
  name                = "terragoat-vn-${var.environment}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    git_commit           = "5b403ea072f7e71c052a7431d21c59b705d2ca2d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-08-19 12:44:42"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "eurogig"
    git_repo             = "disgoat"
    level                = "development"
    team                 = "seceng"
    yor_trace            = "4ae9983c-7e5f-498d-985c-b795118ce09b"
  }
}

resource "azurerm_subnet" "example" {
  name                 = "terragoat-${var.environment}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "ni_linux" {
  name                = "terragoat-linux-${var.environment}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    git_commit           = "5b403ea072f7e71c052a7431d21c59b705d2ca2d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-08-19 12:44:42"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "eurogig"
    git_repo             = "disgoat"
    level                = "development"
    team                 = "seceng"
    yor_trace            = "8d0eeeeb-92f2-47cf-9d3d-11878e0a3f3c"
  }
}

resource "azurerm_network_interface" "ni_win" {
  name                = "terragoat-win-${var.environment}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    git_commit           = "5b403ea072f7e71c052a7431d21c59b705d2ca2d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-08-19 12:44:42"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "eurogig"
    git_repo             = "disgoat"
    level                = "development"
    team                 = "seceng"
    yor_trace            = "14af5fe3-dae6-4ff6-a1ac-f064c1e35c8e"
  }
}

resource azurerm_network_security_group "bad_sg" {
  location            = var.location
  name                = "terragoat-${var.environment}"
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "AllowSSH"
    priority                   = 200
    protocol                   = "TCP"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_port_range     = "22-22"
    destination_address_prefix = "*"
  }

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "AllowRDP"
    priority                   = 300
    protocol                   = "TCP"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_port_range     = "3389-3389"
    destination_address_prefix = "*"
  }
  tags = {
    git_commit           = "5b403ea072f7e71c052a7431d21c59b705d2ca2d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-08-19 12:44:42"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "eurogig"
    git_repo             = "disgoat"
    level                = "development"
    team                 = "seceng"
    yor_trace            = "a75df343-3179-418c-b3fc-76e756f5acd9"
  }
}

resource azurerm_network_watcher "network_watcher" {
  location            = var.location
  name                = "terragoat-network-watcher-${var.environment}"
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    git_commit           = "5b403ea072f7e71c052a7431d21c59b705d2ca2d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-08-19 12:44:42"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "eurogig"
    git_repo             = "disgoat"
    level                = "development"
    team                 = "seceng"
    yor_trace            = "0eaaba45-00a4-440b-acd8-3aabe76828b1"
  }
}

resource azurerm_network_watcher_flow_log "flow_log" {
  enabled                   = false
  network_security_group_id = azurerm_network_security_group.bad_sg.id
  network_watcher_name      = azurerm_network_watcher.network_watcher.name
  resource_group_name       = azurerm_resource_group.example.name
  storage_account_id        = azurerm_storage_account.example.id
  retention_policy {
    enabled = false
    days    = 10
  }
  tags = {
    git_commit           = "5b403ea072f7e71c052a7431d21c59b705d2ca2d"
    git_file             = "terraform/azure/networking.tf"
    git_last_modified_at = "2021-08-19 12:44:42"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "eurogig"
    git_repo             = "disgoat"
    level                = "development"
    team                 = "seceng"
    yor_trace            = "c94adef5-03f1-4f69-a3b8-efd36b64c3f8"
  }
}