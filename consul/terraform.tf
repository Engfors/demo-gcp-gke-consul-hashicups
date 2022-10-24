terraform {
  cloud {
    organization = "<TFC_ORG>"

    workspaces {
      name = "demo-consul"
    }
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.10"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0.2"
    }
  }

  required_version = "~> 1.3"
}

data "terraform_remote_state" "cluster" {
  backend = "remote"
  config = {
    organization = "<TFC_ORG>"
    workspaces = {
      name = var.cluster_workspace
    }
  }
}

# Retrieve GKE cluster information
provider "google" {
  project = data.terraform_remote_state.cluster.outputs.cluster_project
  region  = data.terraform_remote_state.cluster.outputs.region
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = data.terraform_remote_state.cluster.outputs.cluster_host
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = data.terraform_remote_state.cluster.outputs.cluster_ca_certificate

}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.cluster.outputs.cluster_host
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = data.terraform_remote_state.cluster.outputs.cluster_ca_certificate

  }
}
