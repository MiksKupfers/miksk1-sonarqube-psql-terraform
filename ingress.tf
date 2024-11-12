resource "kubernetes_ingress" "ingress" {
  metadata {
    name      = "sonarqube-ingress"
    namespace = "default"
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      host = var.sonarqube_host
      http {
        path {
          path      = "/"
          backend {
            service_name = "sonarqube-sonarqube"
            service_port = 9000
          }
        }
      }
    }
  }

  depends_on = [
    helm_release.sonarqube
  ]
}
