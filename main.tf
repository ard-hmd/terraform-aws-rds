resource "aws_db_instance" "my_db_instances" {
  for_each = { for idx, config in var.database_configurations : idx => config }

  engine                  = "mysql"
  identifier              = each.value.identifier
  allocated_storage       = each.value.allocated_storage
  engine_version          = each.value.engine_version
  instance_class          = each.value.instance_class
  db_name                 = each.value.db_name
  username                = each.value.db_username
  password                = each.value.db_password
  parameter_group_name    = each.value.parameter_group_name
  db_subnet_group_name    = each.value.db_subnet_group_name
  skip_final_snapshot     = each.value.skip_final_snapshot
  publicly_accessible     = each.value.publicly_accessible
  backup_retention_period = each.value.backup_retention_period
  multi_az                = each.value.multi_az
}

