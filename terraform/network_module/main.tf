resource "azurerm_virtual_network" "main" {
  name                = "${var.project_name}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_security_group" "main" {
  name                = "${var.project_name}-SecurityGroup"
  location            = var.rg_location
  resource_group_name = var.rg_name

  dynamic "security_rule" {
    for_each = var.nsg_security_rules
    
    content {
        name                       = "${var.project_name}-${nsg_security_rules.key}"
        description                = lookup(nsg_security_rules, "description", "") 
        priority                   = nsg_security_rules.value["priority"]
        direction                  = nsg_security_rules.value["direction"]
        access                     = lookup(nsg_security_rules, "access", "Allow")
        protocol                   = lookup(nsg_security_rules, "protocol", "Tcp")
        source_port_range          = nsg_security_rules.value["source_port_range"]
        destination_port_range     = nsg_security_rules.value["destination_port_range"]
        source_address_prefix      = nsg_security_rules.value["source_address_prefix"]
        destination_address_prefix = nsg_security_rules.value["destination_address_prefix"]
    }
  }

  tags = {
    environment = "testing"
  }
}