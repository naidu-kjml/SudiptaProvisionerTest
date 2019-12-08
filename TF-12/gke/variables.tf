// General Variables

// GCP Variables
variable "gcp_cluster_count" {
  type = "string"
  description = "Count of cluster instances to start."
}

variable "cluster_name" {
  type = "string"
  description = "Cluster name for the GCP Cluster."
}

variable "vault_addr" {
  type = "string"
  description = "Cluster name for the GCP Cluster."
}

// GCP Outputs
output "gcp_cluster_endpoint" {
  value = "${google_container_cluster.gcp_kubernetes.endpoint}"
}

output "gcp_cluster_name" {
  value = "${google_container_cluster.gcp_kubernetes.name}"
}

output "namespace" {
  value = "default"
}


variable "gcp_credentials_path" {
  default = "secret/gke/harness-exploration-kubernetes"
}

variable "secret_id"{
}

variable "role_id"{
}
