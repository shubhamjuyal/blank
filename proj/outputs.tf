output "ec2_public_ip" {
  value       = aws_instance.main_instance.public_ip
  description = "Public IP of the EC2 instance"
}

output "db_connection_string" {
  value       = "postgresql://dbuser:${var.db_password}@${aws_instance.main_instance.public_ip}:5432/pospcontest"
  description = "Connection string for PostgreSQL database"
  sensitive   = true
}
