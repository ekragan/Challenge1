
variable "mysite_vpc_id" {}
variable "region" {}
variable "project" {}

resource "google_compute_network" "sql_vpc" {
  name                    = "sql-vpc-tf"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "db_subnet1" {
  name          = "subnet9"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.sql_vpc.id
  private_ip_google_access = true
}

resource "google_compute_network_peering" "peering2" {
  depends_on =[
    google_compute_network.sql_vpc
  ]
  name         = "peering2"
  network      = google_compute_network.sql_vpc.id
  peer_network = var.mysite_vpc_id
}
