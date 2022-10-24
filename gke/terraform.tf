terraform {
  cloud {
    organization = "<TFC_ORG>"

    workspaces {
      name = "demo-gke"
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
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.10"
    }
  }

  required_version = "~> 1.3"
}


data "terraform_remote_state" "core" {
  backend = "remote"
  config = {
    organization = "<TFC_ORG>"
    workspaces = {
      name = var.core_workspace
    }
  }
}

provider "google" {
  project = var.google_project
  region  = var.google_region
}

# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}
