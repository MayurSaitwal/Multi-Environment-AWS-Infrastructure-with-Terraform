output "instance_ids" {
  description = "EC2 instance IDs"
  value       = aws_instance.my_instance[*].id
}

output "public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.my_instance[*].public_ip
}

output "public_dns" {
  description = "Public DNS names of the EC2 instances"
  value       = aws_instance.my_instance[*].public_dns
}
