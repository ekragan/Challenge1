data "google_project" "prod_project" {}

resource "google_container_cluster" "mysite_gke" {
  depends_on = [
    google_compute_network.mysite_vpc
  ]
  name     = "mysite_gke_cluster"
  location = "us-central1-c"
  initial_node_count       = 1
  remove_default_node_pool = true
  network = google_compute_network.mysite_vpc.name
  subnetwork = google_compute_subnetwork.app_subnet1.name
}

resource "google_container_node_pool" "mysite_cluster_nodes" {
  name       = "mysite-node-pool"
  location   = "us-central1-c"
  cluster    = google_container_cluster.mysite_gke.name
  node_count = 1

  node_config {
    machine_type = "n1-standard-2"
    disk_size_gb = 100
    disk_type = "pd-standard"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

#Preparing null resource to get kubernetes credentials that we created using gcloud command
resource "null_resource" "update_kubeconfig"  {
depends_on = [
    google_container_node_pool.mysite_cluster_nodes
  ]
	provisioner "local-exec" {
        command = <<EOF
     	 gcloud container clusters get-credentials ${google_container_cluster.mysite_gke.name} --zone ${google_container_cluster.mysite_gke.location} --project ${data.google_project.prod_project.project_id}
       sleep 5
       EOF
    
    interpreter = ["PowerShell", "-Command"]
  	}
}
