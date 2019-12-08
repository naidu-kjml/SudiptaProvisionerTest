resource "google_container_cluster" "gcp_kubernetes" {
  name               = "${var.cluster_name}"
  zone               = "us-west1-a"
  initial_node_count = "${var.gcp_cluster_count}"
}
