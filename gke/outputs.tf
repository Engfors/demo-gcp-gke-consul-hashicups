output "cluster_name" {
  value = module.gke.name
}

output "cluster_host" {
  value     = "https://${module.gke.endpoint}"
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = base64decode(module.gke.ca_certificate)
  sensitive = true
}

output "cluster_project" {
  value = var.google_project
}

output "region" {
  value = data.google_compute_zones.available.region
}

output "enable_consul_and_hashicups" {
  value = var.enable_consul_and_hashicups
}
