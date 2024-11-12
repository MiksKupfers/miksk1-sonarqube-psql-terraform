variable "postgresql_password" {
  description = "Password for the PSQL"
  type        = string
  default     = "sonarqube123"
}

variable "postgresql_database" {
  description = "DB name for Sonarqube"
  type        = string
  default     = "sonarqube_db"
}

variable "postgresql_username" {
  description = "Username for PSQL"
  type        = string
  default     = "postgres"
}

variable "sonarqube_host" {
  description = "Host for Sonarqube ingress"
  type = string
}

