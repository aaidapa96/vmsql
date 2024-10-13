terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

backend "azurerm" {
    resource_group_name  = "rg-terraform-github-actions-state"
    storage_account_name = "terraformstateaaida23"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true 
}
