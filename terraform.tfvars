aws_region = "eu-west-1"
name       = "reclaim-prod-app"

task_definition = {
  image     = "indlovucloud/reclaim-aws-nukeui"
  cpu       = 512
  memory    = 1024
  log_level = "info"
}

vpc_cidr           = "10.0.0.0/16"
nat_gateway = {
  enable_nat_gateway = true
  single_nat_gateway = true
}

allowed_cidr_blocks = ["0.0.0.0/0"]

tags = {
  Environment = "prod"
  Project     = "reclaim"
}
