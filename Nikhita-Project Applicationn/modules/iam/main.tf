resource "aws_iam_role" "ec2_role_nikhita" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}



resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  path        = "/"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment_nikhita" {
  role       = aws_iam_role.ec2_role_nikhita.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.ec2_role_nikhita.name
}
