variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.4.0/22", "10.0.8.0/22"]
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.30"
}

variable "on_demand_desired_capacity" {
  description = "Desired number of On-Demand worker nodes"
  type        = number
}

variable "on_demand_max_capacity" {
  description = "Maximum number of On-Demand worker nodes"
  type        = number
}

variable "on_demand_min_capacity" {
  description = "Minimum number of On-Demand worker nodes"
  type        = number
}

variable "on_demand_instance_types" {
  description = "List of EC2 instance types for On-Demand worker nodes"
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
