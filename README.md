# Terraform AWS RDS Module

This module provides a Terraform solution for creating and managing RDS instances in AWS.

## Features

- Creation of RDS instances with specified configurations.
- Automatic generation of security groups for RDS instances.
- Outputs for key details of the RDS instances and associated security groups.

## Usage

To use this module in your Terraform configuration:

```hcl
module "aws_rds" {
  source = "github.com/ard-hmd/terraform-aws-rds.git"

  aws_region = "eu-west-3"
  database_configurations = [
    {
      identifier              = "example-db"
      allocated_storage       = 20
      engine_version          = "5.7"
      instance_class          = "db.t2.micro"
      db_name                 = "mydatabase"
      db_username             = "admin"
      db_password             = "password"
      parameter_group_name    = "default.mysql5.7"
      db_subnet_group_name    = "my-subnet-group"
      skip_final_snapshot     = true
      publicly_accessible     = false
      backup_retention_period = 7
      vpc_id                  = "vpc-x"
      allowed_cidrs           = ["10.0.0.0/16"]
      sg_name                 = "example-db-sg"
      sg_description          = "Security group for example-db"
      multi_az                = false
    }
  ]
}
```

## Variables

- `aws_region`: The AWS region where the RDS instances will be created. Default is `eu-west-3`.
- `database_configurations`: A list of configurations for the RDS instances. This includes details like instance identifier, storage size, engine version, and more.
- `resource_name_prefix`: A prefix for naming resources. Default is `terraform-aws-rds-`.

## Outputs

- `db_instance_arn`: The ARN of the RDS instances.
- `db_instance_endpoint`: The connection endpoints of the RDS instances.
- `db_instance_identifier`: The identifiers of the RDS instances.
- `rds_security_group_ids`: The IDs of the Security Groups associated with the RDS instances.
- `rds_security_group_names`: The names of the Security Groups associated with the RDS instances.
- `rds_security_group_descriptions`: The descriptions of the Security Groups associated with the RDS instances.
