output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint URL for the EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "vpc_id" {
  description = "The ID of the VPC created for the EKS cluster."
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "List of private subnet IDs where EKS nodes are deployed."
  value       = module.vpc.private_subnets
}

output "public_subnet_ids" {
  description = "List of public subnet IDs (for NAT Gateways, ELBs etc.)."
  value       = module.vpc.public_subnets
}

output "eks_node_group_roles_arn" {
  description = "ARN of the IAM role used by EKS worker nodes."
  value       = aws_iam_role.eks_node_group_role.arn
}

output "ebs_csi_irsa_role_arn" {
  description = "ARN of the IAM role created for the EBS CSI driver service account."
  value       = module.ebs_csi_driver_irsa.iam_role_arn
}

output "ebs_storage_class_name" {
  description = "The name of the default EBS StorageClass created."
  value       = kubernetes_storage_class.ebs_sc.metadata[0].name
}