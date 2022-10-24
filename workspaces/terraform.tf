terraform {
  cloud {
    organization = "<TFC_ORG>"

    workspaces {
      name = "workspace-factory"
    }
  }
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.37.0"
    }
  }

  required_version = "~> 1.3"
}
