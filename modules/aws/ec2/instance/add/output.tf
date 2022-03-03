output "id" {
  description = "The instance IDs"
  value       = [aws_instance.default.*.id]
}

output "availability_zone" {
  description = "The availability zone of the instances"
  value       = [aws_instance.default.*.availability_zone]
}

# output "public_ip" {
#   description = "The public IP addresses of the instance"
#   value       = [aws_instance.default.*.public_ip]
# }
