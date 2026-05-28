output "vpc_id" {
  description = "VPC ID."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs (ALB)."
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "Private subnet IDs (ECS tasks)."
  value       = module.vpc.private_subnets
}

output "alb_dns_name" {
  description = "ALB DNS name — point your DNS record here."
  value       = module.reclaim.alb_dns_name
}

output "alb_arn" {
  description = "ALB ARN."
  value       = module.reclaim.alb_arn
}

output "service_name" {
  description = "ECS service name."
  value       = module.reclaim.service_name
}

output "cluster_arn" {
  description = "ECS cluster ARN."
  value       = module.reclaim.cluster_arn
}

output "task_role_arn" {
  description = "Task role ARN — add to target account trust policies."
  value       = module.reclaim.task_role_arn
}

output "log_group_name" {
  description = "CloudWatch log group."
  value       = module.reclaim.log_group_name
}
