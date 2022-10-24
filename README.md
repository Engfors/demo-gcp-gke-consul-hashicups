# gke-consul-hashicups

Deploys a GKE cluster with Consul and HashiCups

## Getting started

Start by replacing <GITHUB_ROOT> with the name of your GitHub repository root & <TFC_ORG> with your Terraform Cloud organisation.

## Required module

For the repository https://github.com/Engfors/terraform-tfe-workspace-factory and connect is as a Terraform Cloud private registry module, see https://developer.hashicorp.com/terraform/tutorials/modules/module-private-registry-share for a tutorial.

## Order of execution

1. workspace
2. core
3. gke
4. consul
5. hashicups

## Contributors

Emil Engfors - Author
