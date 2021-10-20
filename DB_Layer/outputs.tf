output "uname" {
    value = google_sql_user.users.name
}

output "pass" {
    value = google_sql_user.users.password
}

output "pubip" {
    value = google_sql_database_instance.sql_db.public_ip_address
}

output "dbname" {
    value = google_sql_database.database.name
}

output "sql_vpc_id" {
  value = google_compute_network.sql_vpc.id
}
