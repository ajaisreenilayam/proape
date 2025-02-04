resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  # Optionally, specify cluster version and logging
  version = var.cluster_version

  # Optional: Enable cluster logging
  enabled_cluster_log_types = ["api", "audit", "authenticator"]

  # Additional settings if required
}

