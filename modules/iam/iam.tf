# AWS Caller Identity
data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "eks_nodegroup_policy" {
  name        = "EKSNodeGroupPolicy"
  description = "IAM Policy for EKS Managed Node Group with specific permissions"
  policy      = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "elasticloadbalancing:*",
          "ec2:Describe*",
          "ec2:CreateSecurityGroup",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:DeleteSecurityGroup",
          "ec2:CreateTags",
          "iam:ListRolePolicies",
          "iam:ListRoles",
          "iam:ListInstanceProfiles",
          "iam:ListAttachedRolePolicies",
          "iam:GetPolicy",
          "iam:GetPolicyVersion",
          "iam:GetRole",
          "iam:GetRolePolicy",
          "iam:GetInstanceProfile",
          "iam:ListAttachedRolePolicies",
          "iam:ListRoleTags",
          "iam:ListInstanceProfilesForRole",
          "iam:ListRolePolicies",
          "iam:ListPolicyTags",
          "iam:ListPolicyVersions"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_role" "aws_lb_controller" {
  name = "aws-load-balancer-controller-role"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${var.oidc_provider_url}"
        },
        "Action": "sts:AssumeRoleWithWebIdentity",
        "Condition": {
          "StringEquals": {
            "${var.oidc_provider_url}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  }
  EOF
}

resource "aws_iam_role_policy_attachment" "lb_controller_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AWSLoadBalancerControllerIAMPolicy"
  role       = aws_iam_role.aws_lb_controller.name
}
