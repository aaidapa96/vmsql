provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  use_oidc = true
}


resource "random_id" "random" {
  byte_length = 4
}

backend "azurerm" {
    resource_group_name  = "rg-terraform-github-actions-state"
    storage_account_name = "terraformstateaaida23"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true 
}
