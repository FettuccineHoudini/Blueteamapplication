
################################################################################
# EKS Module
################################################################################



module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.2.1"

  cluster_name                   = "blue-team-cluster"
  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id     = aws_vpc.main.id
  subnet_ids = concat(aws_subnet.public.*.id)



  create_iam_role          = true
  iam_role_name            = "blue-team-ng-role"
  iam_role_use_name_prefix = false
  iam_role_description     = "Blue team EKS managed node group role"
  iam_role_tags = {
    Purpose = "Protector of the kubelet"
  }
  iam_role_additional_policies = {
    AmazonEC2ContainerRegistryReadOnly = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  }

  eks_managed_node_group_defaults = {
    ami_type                              = "AL2_x86_64"
    instance_types                        = ["m5.large"]
    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    blue-team-cluster = {
      min_size       = 2
      max_size       = 4
      desired_size   = 2
      instance_types = ["t3.medium"]
      capacity_type  = "ON-DEMAND"
      tags = {
        ExtraTag = "helloworld"
      }
    }
  }

  tags = {
    "Name" = "${var.default_tags.username}-eks"
  }
}


