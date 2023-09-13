# # Output: ARN of the RDS instance
# output "db_instance_arn" {
#   description = "The ARN of the RDS instance"
#   value       = aws_db_instance.my_db_instances[count.index].arn
# }

# # Output: Connection Endpoint of the RDS instance
# output "db_instance_endpoint" {
#   description = "The connection endpoint"
#   value       = aws_db_instance.my_db_instances[count.index].endpoint
# }

# # Output: Identifier of the RDS instance
# output "db_instance_identifier" {
#   description = "The identifier of the RDS instance"
#   value       = aws_db_instance.my_db_instances[count.index].identifier
# }


output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.my_db_instances[count.index].arn
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.my_db_instances[count.index].endpoint
}

output "db_instance_identifier" {
  description = "The identifier of the RDS instance"
  value       = aws_db_instance.my_db_instances[count.index].identifier
}