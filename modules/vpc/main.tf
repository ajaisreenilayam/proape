module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.15.0"  # Replace with the latest version if newer

  name = "proape-vpc"
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name        = "proape-vpc"
    Environment = var.environment
  }
}


