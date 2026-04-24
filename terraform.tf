terraform {
  cloud {
    organization = "tschy"

    workspaces {
      name = "classifieds-lifecycle-infra"
    }
  }

  required_providers {
    railway = {
      source  = "terraform-community-providers/railway"
      version = "0.6.2"
    }
  }
}

variable "railway_account_token" {}

provider "railway" {
  token = var.railway_account_token

}