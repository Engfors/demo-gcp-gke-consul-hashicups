output "consul_active" {
  value = try(helm_release.consul[0].status == "deployed" ? true : false, false)
}
