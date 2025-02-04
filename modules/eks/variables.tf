variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.30"
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "spot_desired_capacity" {
  description = "Desired number of Spot worker nodes"
  type        = number
}

variable "spot_max_capacity" {
  description = "Maximum number of Spot worker nodes"
  type        = number
}

variable "spot_min_capacity" {
  description = "Minimum number of Spot worker nodes"
  type        = number
}

variable "spot_instance_types" {
  description = "List of EC2 instance types for Spot worker nodes"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
