module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name
  cidr = var.vpc_cidr

  azs             = local.azs
  public_subnets  = [for i, az in local.azs : cidrsubnet(var.vpc_cidr, 4, i)]
  private_subnets = [for i, az in local.azs : cidrsubnet(var.vpc_cidr, 4, i + 2)]

  enable_nat_gateway     = var.nat_gateway.enable_nat_gateway
  single_nat_gateway     = var.nat_gateway.single_nat_gateway
  enable_dns_support     = true
  enable_dns_hostnames   = true

  public_subnet_tags  = { Tier = "public" }
  private_subnet_tags = { Tier = "private" }

  tags = local.tags
}
