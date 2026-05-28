module "reclaim" {
  source  = "King-Zingelwayo/reclaim-nukeui-ecs/aws"
  version = "1.0.0"

  name = local.name

  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.private_subnets
  alb_subnet_ids = module.vpc.public_subnets

  desired_count    = 1
  assign_public_ip = false
  create_alb       = true
  certificate_arn  = var.certificate_arn
  enable_s3files   = false

  allowed_cidr_blocks      = var.allowed_cidr_blocks
  auth_token_secret_arn    = var.auth_token_secret_arn
  target_account_role_arns = var.target_account_role_arns

  task_definition = {
    image      = "${var.task_definition.image}:latest"
    cpu        = var.task_definition.cpu
    memory     = var.task_definition.memory
    log_level  = var.task_definition.log_level
    aws_region = var.aws_region
  }

  tags = local.tags
}
