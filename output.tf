# output "db_instance_arn" {
#   description = "The ARN of the RDS instances"
#   value       = { for idx, instance in aws_db_instance.my_db_instances : idx => instance.arn }
# }

# output "db_instance_endpoint" {
#   description = "The connection endpoints of the RDS instances"
#   value       = { for idx, instance in aws_db_instance.my_db_instances : idx => instance.endpoint }
# }

# output "db_instance_identifier" {
#   description = "The identifiers of the RDS instances"
#   value       = { for idx, instance in aws_db_instance.my_db_instances : idx => instance.identifier }
# }


output "db_instance_arn" {
  description = "The ARN of the RDS instances"
  value       = { for idx, instance in aws_db_instance.my_db_instances : idx => instance.arn }
}

output "db_instance_endpoint" {
  description = "The connection endpoints of the RDS instances"
  value       = { for idx, instance in aws_db_instance.my_db_instances : idx => instance.endpoint }
}

output "db_instance_identifier" {
  description = "The identifiers of the RDS instances"
  value       = { for idx, instance in aws_db_instance.my_db_instances : idx => instance.identifier }
}

output "replica_db_instance_arns" {
  description = "The ARNs of the RDS replica instances"
  value       = [for instance in aws_db_instance.my_db_instances : "${instance.identifier}-replica"]
}

output "replica_db_instance_endpoints" {
  description = "The connection endpoints of the RDS replica instances"
  value       = [for instance in aws_db_instance.my_db_instances : "${instance.identifier}-replica"]
}

output "replica_db_instance_identifiers" {
  description = "The identifiers of the RDS replica instances"
  value       = [for instance in aws_db_instance.my_db_instances : "${instance.identifier}-replica"]
}
