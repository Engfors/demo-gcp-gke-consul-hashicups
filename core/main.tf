module "project_services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.0"

  project_id                  = var.google_project
  disable_services_on_destroy = false

  activate_apis = [
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "container.googleapis.com"
  ]
}

module "network" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.2"

  project_id   = var.google_project
  network_name = "demo-network"
  subnets = [
    {
      subnet_name   = "demo-subnet-01"
      subnet_ip     = "10.13.37.0/24"
      subnet_region = var.google_region
    },
  ]
  secondary_ranges = {
    "demo-subnet-01" = [
      {
        ip_cidr_range = "10.100.0.0/16"
        range_name    = "demo-subnet-01-gke-01-pods"
      },
      {
        ip_cidr_range = "10.200.0.0/20"
        range_name    = "demo-subnet-01-gke-01-services"
      },
    ]
  }
  depends_on = [
    module.project_services
  ]
}
