# Cluster name
variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

# Cluster IAM role ARN
variable "cluster_role_arn" {
  type        = string
  description = "IAM role ARN for the EKS control plane"
}

# Node group name
variable "node_group_name" {
  type        = string
  description = "The name of the EKS node group"
}

# Node IAM role ARN
variable "node_role_arn" {
  type        = string
  description = "IAM role ARN for the EKS worker nodes"
}

# Subnets
variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs where the EKS cluster and nodes will run"
}

# Cluster version
variable "cluster_version" {
  type        = string
  description = "The Kubernetes version for the EKS cluster"
  default     = "1.21"  # You can set a default or leave it up to the caller to provide
}

# Node group scaling configuration
variable "node_desired_count" {
  type        = number
  description = "Desired number of worker nodes"
  default     = 2
}

variable "node_min_count" {
  type        = number
  description = "Minimum number of worker nodes"
  default     = 1
}

variable "node_max_count" {
  type        = number
  description = "Maximum number of worker nodes"
  default     = 3
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet IDs"
}

