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
    client_id            = secret.AZURE_CLIENT_ID  # Can also be set via `ARM_CLIENT_ID` environment variable.
    client_secret        =   # Can also be set via `ARM_CLIENT_SECRET` environment variable.
    subscription_id      = secrets.AZURE_SUBSCRIPTION_ID  # Can also be set via `ARM_SUBSCRIPTION_ID` environment variable.
    tenant_id            = secrets.AZURE_TENANT_ID  # Can also be set via `ARM_TENANT_ID` environment variable.
    use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
  }
}

