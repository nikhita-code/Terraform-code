
resource "aws_iam_role" "ec2_role_nikhita" {
  name = "my-ec2-role_nikhita"

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
  name        = "test_policy_nikhita"
  path        = "/"
  description = "My test policy nikhita"

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
  name = "my-ec2-instance-profile_nikhita"
  role = aws_iam_role.ec2_role_nikhita.name
}
