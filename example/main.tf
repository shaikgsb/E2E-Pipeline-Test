resource "azurerm_resource_group" "test-rg" {
  name     = "ADO-rg"
  location = "UK South"
}

resource "azurerm_virtual_network" "test-vnet1" {
  name                = "terra-vnet"
  resource_group_name = azurerm_resource_group.test-rg.name
  location            = azurerm_resource_group.test-rg.location
  address_space       = ["172.16.0.0/16"]
}

resource "azurerm_subnet" "subnet-test" {
  name                 = "terra-subnet1"
  resource_group_name  = azurerm_resource_group.test-rg.name
  virtual_network_name = azurerm_virtual_network.test-vnet1.name
  address_prefixes     = ["172.16.1.0/24"]
}
