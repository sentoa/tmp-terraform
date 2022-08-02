terraform {
    terraform.version = "1.1.5"
    required_providers {
        kubernetes = {
            source = "hashicorp/kubernetes"
            version = "2.11.0"
        }
  }
}

provider "kubernetes" {
  # Configuration options
  config_path = "/root/.kube/config"
}

resource "kubernetes_deployment" "frontend"{

    metadata {
        name = "frontend"
    }

    spec {

        replicas = 4
    
        template {
            metadata {
                labels = {
                    name: "webapp"
                }
            }
        spec {
        container {
          image = "kodekloud/webapp-color:v1"
          name  = "simple-webapp"
          port = [8080]
        
        }
    }
}
}
}