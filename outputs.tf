output "sonarqube_host" {
  value = kubernetes_ingress.ingress.spec[0].rule[0].host
}