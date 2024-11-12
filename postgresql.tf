resource "helm_release" "postgresql" {
  name       = "postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  namespace  = "default"

  set {
    name  = "auth.postgresPassword"
    value = var.postgresql_password
  }

  set {
    name  = "auth.postgresqlUsername"
    value = var.postgresql_username
  }

  set {
    name  = "auth.database"
    value = var.postgresql_database
  }
}
