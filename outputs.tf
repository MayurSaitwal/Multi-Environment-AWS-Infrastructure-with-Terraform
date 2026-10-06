output "dev_instance_ids" {
  description = "EC2 instance IDs for development environment"
  value       = module.dev-infra.instance_ids
}

output "stg_instance_ids" {
  description = "EC2 instance IDs for staging environment"
  value       = module.stg-infra.instance_ids
}

output "prd_instance_ids" {
  description = "EC2 instance IDs for production environment"
  value       = module.prd-infra.instance_ids
}

output "dev_instance_public_ips" {
  description = "Public IP addresses of development instances"
  value       = module.dev-infra.public_ips
}

output "dev_instance_public_dns" {
  description = "Public DNS names of development instances"
  value       = module.dev-infra.public_dns
}