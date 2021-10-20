output "mysite_vpc_id" {
  value = google_compute_network.mysite_vpc.id
}

output "mysite_static_ip" {
  value = google_compute_address.static_ip.address
}
