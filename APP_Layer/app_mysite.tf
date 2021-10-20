variable "uname" {}
variable "pass" {}
variable "pubip" {}
variable "dbname" {}

data "google_client_config" "provider" {}

data "google_container_cluster" "my_cluster" {
  depends_on = [
    google_container_cluster.mysite_gke
  ]
  name     = "mysite_gke_cluster"
  location = "us-central1-c"
}

provider "kubernetes" {
  load_config_file = true

  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth.0.cluster_ca_certificate,
  )
}

resource "google_compute_address" "static_ip" {
  name = "static-ip-address"
  region = "us-central1"
  project = "dev-sandbox2"
}



#deployment
resource "kubernetes_deployment" "mysite" {
  metadata {
    name = "myfirstsite-example"
    labels = {
      test = "MyFirstSite"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "MyFirstSite"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyFirstSite"
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = "example"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

#Using a K8 service to attach a Load balancer to the website so that it is accesible outside world using PublicIP
resource "kubernetes_service" "mysite_service" {
  metadata {
    name = "mysite-service"
   
  }
  spec {
    load_balancer_ip = google_compute_address.static_ip.address
    selector = {
      test = "MyFirstSite"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  
  }
}
