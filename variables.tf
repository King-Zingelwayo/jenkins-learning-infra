variable "aws_region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "eu-west-1"
}

variable "name" {
  description = "Name prefix for all resources."
  type        = string
  default     = "reclaim-prod"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/20"
}

variable "nat_gateway" {
  description = "NAT gateway configuration."
  type = object({
    enable_nat_gateway = bool
    single_nat_gateway = bool
  })
  default = {
    enable_nat_gateway = true
    single_nat_gateway = true
  }
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to reach the ALB."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "certificate_arn" {
  description = "ACM certificate ARN for HTTPS on the ALB. Null = HTTP only."
  type        = string
  default     = null
}

variable "auth_token_secret_arn" {
  description = "Secrets Manager ARN for NUKEUI_AUTH_TOKEN. Null = no auth."
  type        = string
  default     = null
}

variable "target_account_role_arns" {
  description = "IAM role ARNs in target accounts the task role may assume."
  type        = list(string)
  default     = []
}

variable "task_definition" {
  description = "ECS task definition configuration."
  type = object({
    image     = string
    cpu       = number
    memory    = number
    log_level = string
  })
  default = {
    image     = ""
    cpu       = 512
    memory    = 1024
    log_level = "info"
  }
}

variable "tags" {
  description = "Extra tags applied to all resources."
  type        = map(string)
  default     = {}
}
