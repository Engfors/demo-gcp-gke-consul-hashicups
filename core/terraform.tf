terraform {
  cloud {
    organization = "<TFC_ORG>"

    workspaces {
      name = "demo-core"
    }
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.41"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.41"
    }
  }

  required_version = "~> 1.3"
}
