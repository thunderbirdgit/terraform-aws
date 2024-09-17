output "oidc_provider_url" {
  value = "oidc.eks.${var.region}.amazonaws.com/id/${aws_eks_cluster.cluster.id}"
}
