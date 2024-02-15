
# Variables file to make our lives easier... kinda
variable "default_tags" {
  type = map(string)
  default = {
    "username" = "blue"
  }
  description = "This is a resource in my terraform testing environment"
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "public_subnet_count" {
  type        = number
  description = "Number of public subnets in VPC"
  default     = 2
}
variable "private_subnet_count" {
  type        = number
  description = "Number of private subnets in VPC"
  default     = 2
}
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR for VPC"
}

# Variable for cluster name
variable "cluster_name" {
  default = "blue-team-cluster"
  type    = string
}

variable "codecommit_repository_name" {
  type = string
  default = "blue-repo"
}

variable "codebuild_role_name" {
  type    = string
  default = "blue-codebuild-role"
}
variable "codepipeline_role_name" {
  type    = string
  default = "blue-codepipeline-role"
}
variable "codebuild_policy_name" {
  type    = string
  default = "blue-codebuild-policy"
}
variable "codepipeline_policy_name" {
  type    = string
  default = "blue-codepipeline-policy"
}
variable "codebuild_plan_project_name" {
  type    = string
  default = "blue-codebuild-project-plan"
}
variable "codebuild_apply_project_name" {
  type    = string
  default = "blue-codebuild-project-apply"
}
variable "codepipeline_name" {
  type    = string
  default = "blue-codepipeline"
}





