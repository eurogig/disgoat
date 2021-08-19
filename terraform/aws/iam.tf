resource "aws_iam_user" "user" {
  name          = "${local.resource_prefix.value}-user"
  force_destroy = true

  tags = {
    Name                 = "${local.resource_prefix.value}-user"
    Environment          = local.resource_prefix.value
    git_commit           = "5b403ea072f7e71c052a7431d21c59b705d2ca2d"
    git_file             = "terraform/aws/iam.tf"
    git_last_modified_at = "2021-08-19 12:44:42"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "eurogig"
    git_repo             = "disgoat"
    level                = "development"
    team                 = "seceng"
    yor_trace            = "0b5d4e62-a8ab-4b68-b714-081aee557afd"
  }

}

resource "aws_iam_access_key" "user" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "userpolicy" {
  name = "excess_policy"
  user = "${aws_iam_user.user.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "s3:*",
        "lambda:*",
        "cloudwatch:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "username" {
  value = aws_iam_user.user.name
}

output "secret" {
  value = aws_iam_access_key.user.encrypted_secret
}

