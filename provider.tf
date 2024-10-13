provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  use_oidc = true
}


resource "random_id" "random" {
  byte_length = 4 //k
}


