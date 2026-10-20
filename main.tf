data "azurerm_storage_account" "storage_account" {
  for_each=var.storage_accounts
  name                =  each.value.name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_storage_account" "storage_account" {
  for_each = var.storage_accounts
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.replication_type
}

