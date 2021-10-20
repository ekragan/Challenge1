provider "google" {
 credentials = file("./DB_Server/db_key.json")
 project     = var.project
 region      = var.region
}
