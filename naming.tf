locals {
  azs  = slice(data.aws_availability_zones.available.names, 0, 2)
  name = var.name
  tags = merge(var.tags, { Environment = "prod", ManagedBy = "terraform" })
}