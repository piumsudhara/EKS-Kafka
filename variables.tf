variable "aws_region" {
  description = "The AWS region where resources will be deployed."
  type        = string
  default     = "ap-southeast-1"
}

variable "common_tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
  default = {
    Project     = "EKS-Cluster"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

variable "vpc_name" {
  description = "Name for the VPC."
  type        = string
  default     = "eks-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "List of availability zones for the VPC."
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "private_subnets_cidr" {
  description = "List of private subnet CIDR blocks."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets_cidr" {
  description = "List of public subnet CIDR blocks."
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "enable_nat_gateway" {
  description = "Whether to enable NAT Gateway for public subnets."
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Whether to deploy a single NAT Gateway across all AZs."
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "Whether to deploy one NAT Gateway per AZ (overrides single_nat_gateway if true)."
  type        = bool
  default     = false
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC."
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Name for the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.31"
}

variable "cluster_endpoint_public_access" {
  description = "Whether the EKS cluster endpoint should be publicly accessible."
  type        = bool
  default     = true
}

variable "node_groups" {
  description = "Map of EKS managed node group configurations."
  type = map(object({
    min_size       = number
    max_size       = number
    desired_size   = number
    instance_types = list(string)
    capacity_type  = string
    disk_size      = number
    labels         = map(string)
    taints = list(object({
      key    = string
      value  = string
      effect = string
    }))
  }))
  default = {
    default = {
      min_size       = 1
      max_size       = 3
      desired_size   = 2
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
      disk_size      = 20
      labels         = {}
      taints         = []
    }
  }
}

variable "cluster_addons" {
  description = "Map of EKS cluster add-ons to configure."
  type        = map(any)
  default = {
    coredns    = { most_recent = true }
    kube-proxy = { most_recent = true }
    vpc-cni    = { most_recent = true }
  }
}

variable "ebs_csi_role_name" {
  description = "Name for the IAM role used by the EBS CSI driver."
  type        = string
  default     = "ebs-csi-driver-role"
}

variable "ebs_csi_addon_version" {
  description = "Version of the AWS EBS CSI driver addon."
  type        = string
  default     = "v1.31.0-eksbuild.1"
}

variable "ebs_storage_class_name" {
  description = "Name for the default EBS StorageClass."
  type        = string
  default     = "gp3-default"
}

variable "ebs_storage_class_type" {
  description = "Type of EBS volume for the default StorageClass (e.g., gp2, gp3, io1, io2)."
  type        = string
  default     = "gp3"
}

variable "ebs_storage_class_is_default" {
  description = "Whether this EBS StorageClass should be the default one."
  type        = bool
  default     = true
}

variable "tfstate_bucket_name" {
  description = "Name of the S3 bucket to store Terraform state."
  type        = string
  default     = "eks-kafka"
}
