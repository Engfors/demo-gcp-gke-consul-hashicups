module "core_workspace" {
  source  = "app.terraform.io/<TFC_ORG>/workspace-factory/tfe"
  version = "1.1.0"

  workspace = [
    {
      name                      = "demo-core"
      organization              = "<TFC_ORG>"
      terraform_version         = var.tf_version
      working_directory         = "core"
      file_triggers_enabled     = true
      trigger_patterns          = ["core/*"]
      remote_state_consumer_ids = [module.gke_workspace.workspace_id[0]]
    }
  ]

  vcs_configuration = [
    {
      identifier     = "<GITHUB_ROOT>/gke-consul-hashicups"
      branch         = "main"
      oauth_token_id = var.vcs_oauth_token_id
    }
  ]

  workspace_variables = {
    "google_project" = {
      "value"     = var.google_project
      "category"  = "terraform"
      "hcl"       = "false"
      "sensitive" = "false"
    },
    "google_region" = {
      "value"     = var.google_region
      "category"  = "terraform"
      "hcl"       = "false"
      "sensitive" = "false"
    }
  }
}

module "gke_workspace" {
  source  = "app.terraform.io/<TFC_ORG>/workspace-factory/tfe"
  version = "1.1.0"

  workspace = [
    {
      name                      = "demo-gke"
      organization              = "<TFC_ORG>"
      terraform_version         = var.tf_version
      working_directory         = "gke"
      file_triggers_enabled     = true
      trigger_patterns          = ["gke/*"]
      remote_state_consumer_ids = [module.consul_workspace.workspace_id[0]]
    }
  ]

  vcs_configuration = [
    {
      identifier     = "<GITHUB_ROOT>/gke-consul-hashicups"
      branch         = "main"
      oauth_token_id = var.vcs_oauth_token_id
    }
  ]

  workspace_variables = {
    "google_project" = {
      "value"     = var.google_project
      "category"  = "terraform"
      "hcl"       = "false"
      "sensitive" = "false"
    },
    "google_region" = {
      "value"     = var.google_region
      "category"  = "terraform"
      "hcl"       = "false"
      "sensitive" = "false"
    },
    "core_workspace" = {
      "value"     = "demo-core"
      "category"  = "terraform"
      "hcl"       = "false"
      "sensitive" = "false"
    },
    "enable_consul_and_hashicups" = {
      "value"     = "true"
      "category"  = "terraform"
      "hcl"       = "false"
      "sensitive" = "false"
    }
  }
}

module "consul_workspace" {
  source  = "app.terraform.io/<TFC_ORG>/workspace-factory/tfe"
  version = "1.1.0"

  workspace = [
    {
      name                  = "demo-consul"
      organization          = "<TFC_ORG>"
      terraform_version     = var.tf_version
      working_directory     = "consul"
      file_triggers_enabled = true
      trigger_patterns      = ["consul/*"]
    }
  ]

  vcs_configuration = [
    {
      identifier         = "<GITHUB_ROOT>/gke-consul-hashicups"
      branch             = "main"
      oauth_token_id     = var.vcs_oauth_token_id
      ingress_submodules = true
    }
  ]

  workspace_variables = {
    "cluster_workspace" = {
      "value"     = "demo-gke"
      "category"  = "terraform"
      "hcl"       = "false"
      "sensitive" = "false"
    }
  }
}
