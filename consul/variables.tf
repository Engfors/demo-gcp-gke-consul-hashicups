variable "release_name" {
  type        = string
  description = "Helm Release name for Consul chart"
  default     = "latest"
}
variable "cluster_workspace" {
  type        = string
  description = "Workspace that created the Kubernetes cluster"
}

variable "replicas" {
  type        = number
  default     = 1
  description = "Number of consul server replicas"
}
