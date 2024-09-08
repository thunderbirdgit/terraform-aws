provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "mongodb" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "mongodb" {
  metadata {
    name      = "mongodb"
    namespace = kubernetes_namespace.mongodb.metadata.0.name
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "mongodb"
      }
    }

    template {
      metadata {
        labels = {
          app = "mongodb"
        }
      }

      spec {
        container {
          name  = "mongodb"
          image = "mongo:4.4"

          port {
            container_port = 27017
          }

          volume_mount {
            name       = "data"
            mount_path = "/data/db"
          }
        }

        volume {
          name = "data"
          empty_dir {}
        }
      }
    }
  }
}
