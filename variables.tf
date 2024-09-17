# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
}

variable "private_subnets" {
  description = "The list of private subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "public_subnets" {
  description = "The list of public subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "cidr_range" {
  description = "Range of IPs"
  type        = string
}

variable "ecr_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository"
  type        = bool
  default     = true
}

variable "additional_tags" {
  description = "Additional tags to apply to the ECR repository"
  type        = map(string)
}

variable "eks_lb_name" {
  description = "The namespace for LB"
  type        = string
}

variable "mongodb_namespace" {
  description = "The namespace for MongoDB"
  type        = string
}

variable "mongodb_replicas" {
  description = "The number of MongoDB replicas"
  type        = number
}

variable "account_id" {
  type = string
}

/*
variable "oidc_provider_url" {
  type = string
}
*/
