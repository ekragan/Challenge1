
variable "mysite_static_ip" {}
variable "user_password" {}
variable "region" {}
variable "project" {}
 
#Using the resource-google_sql_database_instance, provided by terraform, now configuring the  settings of my sql db instance which will run in GCP
resource "google_sql_database_instance" "sql_db" {
  depends_on = [
    google_compute_network.sql_vpc
  ]
  name = "dbuser"
  database_version = "MYSQL_5_7"
  region       = var.region
  settings {
    tier = "db-f1-micro"

     ip_configuration {
                ipv4_enabled = true
                require_ssl  = false

                authorized_networks {
                    name  = "mysiteSQL"
                    value = var.mysite_static_ip
                    //value = "0.0.0.0/0"  
                   }
            }
   }
}

resource "google_sql_database" "database" {
  name      = "mysitedb"
  instance  = google_sql_database_instance.sql_db.name
}


resource "google_sql_user" "users" {
  name     = "root"
  instance = google_sql_database_instance.sql_db.name
  password = var.user_password
}

