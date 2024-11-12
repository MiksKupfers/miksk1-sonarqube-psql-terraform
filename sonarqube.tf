resource "helm_release" "sonarqube" {
  name       = "sonarqube"
  namespace  = "default"
  repository = "https://oteemo.github.io/charts"
  chart      = "sonarqube"

  set {
    name  = "image.pullPolicy"
    value = "Always"
  }

  set {
    name  = "image.tag"
    value = "community"
  }
  
  set {
    name  = "extraConfig.configmaps[0]"
    value = kubernetes_config_map.external-sonarqube-opts.metadata[0].name
  }

  set {
    name  = "postgresql.enabled"
    value = "false"
  }

  set {
    name  = "persistence.enabled"
    value = "true"
  }

  set {
    name  = "persistence.existingClaim"
    value = kubernetes_persistent_volume_claim.pvc.metadata[0].name
  }

  set {
    name  = "postgresql.postgresqlPassword"
    value = var.postgresql_password
  }

  set {
    name  = "postgresql.postgresqlUsername"
    value = var.postgresql_username
  }

  depends_on = [
    helm_release.postgresql,
    kubernetes_persistent_volume_claim.pvc,
    kubernetes_config_map.external-sonarqube-opts
  ]
}
