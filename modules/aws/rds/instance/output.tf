output "id" {
  description = "The RDS instance IDs"
  value       = [aws_db_instance.default.*.id]
}
