# gke-consul-demo
Deploys a GKE cluster for demo with Consul

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.41 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 4.41 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.10 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.41.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google | n/a |

### Resources

| Name | Type |
|------|------|
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |
| [terraform_remote_state.core](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_core_workspace"></a> [core\_workspace](#input\_core\_workspace) | n/a | `string` | n/a | yes |
| <a name="input_google_project"></a> [google\_project](#input\_google\_project) | The Google Cloud Project ID | `string` | n/a | yes |
| <a name="input_google_region"></a> [google\_region](#input\_google\_region) | n/a | `string` | n/a | yes |
| <a name="input_cluster_machine_type"></a> [cluster\_machine\_type](#input\_cluster\_machine\_type) | n/a | `string` | `"n1-standard-1"` | no |
| <a name="input_enable_consul_and_hashicups"></a> [enable\_consul\_and\_hashicups](#input\_enable\_consul\_and\_hashicups) | n/a | `bool` | `false` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cluster_host"></a> [cluster\_host](#output\_cluster\_host) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_cluster_project"></a> [cluster\_project](#output\_cluster\_project) | n/a |
| <a name="output_enable_consul_and_hashicups"></a> [enable\_consul\_and\_hashicups](#output\_enable\_consul\_and\_hashicups) | n/a |
| <a name="output_region"></a> [region](#output\_region) | n/a |
<!-- END_TF_DOCS -->
