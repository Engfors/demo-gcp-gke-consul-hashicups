variable "google_project" {
  type        = string
  description = "The Google Cloud Project ID"
}

variable "google_region" {
  type = string
}

variable "enable_consul_and_hashicups" {
  type    = bool
  default = false
}

variable "cluster_machine_type" {
  type    = string
  default = "n1-standard-1"
}

variable "core_workspace" {
  type = string
}
