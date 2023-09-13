# Set the default AWS region for the resources
variable "aws_region" {
  default = "eu-west-3"
  description = "Default AWS region where resources will be created."
}

variable "database_configurations" {
  description = "List of database configurations."
  type = list(object({
    identifier              = string
    allocated_storage       = number
    engine_version          = string
    instance_class          = string
    db_name                 = string
    db_username             = string
    db_password             = string
    parameter_group_name    = string
    db_subnet_group_name    = string
    skip_final_snapshot     = bool
    publicly_accessible     = bool
    backup_retention_period = number
    vpc_id                  = string
    allowed_cidrs           = string
    is_replica              = bool            # Nouveau champ pour indiquer s'il s'agit d'une réplique
    source_db_identifier    = string          # Nouveau champ pour l'identifiant de la base source (pour les réplicas)
  }))
  default = []
}


