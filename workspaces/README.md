<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.37.0 |

### Providers

No providers.

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_consul_workspace"></a> [consul\_workspace](#module\_consul\_workspace) | app.terraform.io/engfors-demo/workspace-factory/tfe | 1.1.0 |
| <a name="module_core_workspace"></a> [core\_workspace](#module\_core\_workspace) | app.terraform.io/engfors-demo/workspace-factory/tfe | 1.1.0 |
| <a name="module_gke_workspace"></a> [gke\_workspace](#module\_gke\_workspace) | app.terraform.io/engfors-demo/workspace-factory/tfe | 1.1.0 |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_google_project"></a> [google\_project](#input\_google\_project) | n/a | `any` | n/a | yes |
| <a name="input_google_region"></a> [google\_region](#input\_google\_region) | n/a | `any` | n/a | yes |
| <a name="input_tf_version"></a> [tf\_version](#input\_tf\_version) | n/a | `any` | n/a | yes |
| <a name="input_vcs_oauth_token_id"></a> [vcs\_oauth\_token\_id](#input\_vcs\_oauth\_token\_id) | n/a | `any` | n/a | yes |

### Outputs

No outputs.
<!-- END_TF_DOCS -->