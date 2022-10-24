# gke-consul-vault
Deploys a GKE cluster with Vault and Consul

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.10 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0.2 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0.2 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.10.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.0.3 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [helm_release.consul](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [terraform_remote_state.cluster](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_workspace"></a> [cluster\_workspace](#input\_cluster\_workspace) | Workspace that created the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Helm Release name for Consul chart | `string` | `"latest"` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of consul server replicas | `number` | `1` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_consul_active"></a> [consul\_active](#output\_consul\_active) | n/a |
<!-- END_TF_DOCS -->
