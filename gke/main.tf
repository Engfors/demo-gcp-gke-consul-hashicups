data "google_compute_zones" "available" {}

locals {
  network_name    = data.terraform_remote_state.core.outputs.network_name
  subnetwork_name = data.terraform_remote_state.core.outputs.subnetwork_name
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.google_project
  name                       = "demo-cluster"
  region                     = data.google_compute_zones.available.region
  zones                      = [data.google_compute_zones.available.names[0], data.google_compute_zones.available.names[1], data.google_compute_zones.available.names[2]]
  network                    = local.network_name
  subnetwork                 = local.subnetwork_name[0]
  ip_range_pods              = "${local.subnetwork_name[0]}-gke-01-pods"
  ip_range_services          = "${local.subnetwork_name[0]}-gke-01-services"
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false

  node_pools = [
    {
      name               = "demo-cluster-node-pool-01"
      machine_type       = var.cluster_machine_type
      node_locations     = "${data.google_compute_zones.available.names[1]},${data.google_compute_zones.available.names[2]}"
      min_count          = var.enable_consul_and_hashicups ? 1 : 0
      max_count          = 3
      spot               = true
      disk_size_gb       = 20
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      auto_repair        = true
      auto_upgrade       = true
      initial_node_count = var.enable_consul_and_hashicups ? 1 : 0
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_labels = {
    all = {}

    demo-cluster-node-pool-01 = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    demo-cluster-node-pool-01 = {
      node-pool-metadata-custom-value = "demo-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    demo-cluster-node-pool-01 = [
      {
        key    = "demo-cluster-node-pool-01"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    demo-cluster-node-pool-01 = [
      "demo-cluster-node-pool-01",
    ]
  }
}
