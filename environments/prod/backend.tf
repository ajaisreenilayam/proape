terraform {
  backend "s3" {
    bucket         = "proape-terraform-state-us"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "proape-terraform-lock"
  }
}
