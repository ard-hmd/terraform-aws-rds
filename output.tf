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