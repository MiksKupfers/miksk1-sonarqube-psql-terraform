resource "kubernetes_persistent_volume_claim" "pvc" {
  metadata {
    name      = "sonarqube-pvc"
    namespace = "default"
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "15Gi"
      }
    }
  }
}
