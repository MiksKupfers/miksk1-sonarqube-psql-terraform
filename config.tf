resource "kubernetes_namespace" "default" {
  metadata {
    name = "default"
  }
}

resource "kubernetes_config_map" "external-sonarqube-opts" {
  metadata {
    name      = "external-sonarqube-opts"
    namespace = "default"
  }
  data = {
    SONARQUBE_JDBC_USERNAME = var.postgresql_username
    SONARQUBE_JDBC_USERNAME = var.postgresql_password
    SONARQUBE_JDBC_URL      = "jdbc:postgresql://postgresql.default.svc.cluster.local:5432/${var.postgresql_database}"
  }
}
