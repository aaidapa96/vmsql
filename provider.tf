provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}


resource "random_id" "random" {
  byte_length = 4
}

data "terraform_remote_state" "foo" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-github-actions-state"
    storage_account_name = "terraformstateaaida23"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    client_id            = "b8b1b7a3-3864-4135-863d-c92658e9418a"  # Can also be set via `ARM_CLIENT_ID` environment variable.
    client_secret        = "z-E8Q~sb17Wm1fPvcI0xgL.I9tMguOpFaUjS5cij"  # Can also be set via `ARM_CLIENT_SECRET` environment variable.
    subscription_id      = "189548b6-6700-43c9-a255-ea1c906f05a2"  # Can also be set via `ARM_SUBSCRIPTION_ID` environment variable.
    tenant_id            = "c7cdcf34-cd85-4ba1-bd24-55afb4ba40bf"  # Can also be set via `ARM_TENANT_ID` environment variable.
    use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
  }
}
