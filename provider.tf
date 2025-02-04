provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
}
