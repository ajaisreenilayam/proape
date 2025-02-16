module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  environment        = var.environment
}

