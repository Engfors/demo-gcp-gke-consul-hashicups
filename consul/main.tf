resource "helm_release" "consul" {
  count      = data.terraform_remote_state.cluster.outputs.enable_consul_and_hashicups ? 1 : 0
  name       = "consul"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  version    = "0.49.0"

  values = [
    file("consul.yaml")
  ]
}
