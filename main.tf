resource "aws_security_group" "rds_sg" {
  count       = length(var.database_configurations)
  name        = "rds-sg-${var.database_configurations[count.index].identifier}"
  description = "Security Group for RDS instance ${var.database_configurations[count.index].identifier}"
  vpc_id      = var.database_configurations[count.index].vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.database_configurations[count.index].allowed_cidrs]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg-${var.database_configurations[count.index].identifier}"
  }
}

resource "aws_db_instance" "my_db_instances" {
  count = length(var.database_configurations)

  engine                  = "mysql"
  identifier              = var.database_configurations[count.index].identifier
  allocated_storage       = var.database_configurations[count.index].allocated_storage
  engine_version          = var.database_configurations[count.index].engine_version
  instance_class          = var.database_configurations[count.index].instance_class
  db_name                 = var.database_configurations[count.index].db_name
  username                = var.database_configurations[count.index].db_username
  password                = var.database_configurations[count.index].db_password
  parameter_group_name    = var.database_configurations[count.index].parameter_group_name
  db_subnet_group_name    = var.database_configurations[count.index].db_subnet_group_name
  rds_sg_id               = [aws_security_group.rds_sg[count.index].id]
  skip_final_snapshot     = var.database_configurations[count.index].skip_final_snapshot
  publicly_accessible     = var.database_configurations[count.index].publicly_accessible
  backup_retention_period = var.database_configurations[count.index].backup_retention_period
}

