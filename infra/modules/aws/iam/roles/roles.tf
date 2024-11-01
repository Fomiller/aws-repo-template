resource "aws_iam_role" "lambda_hello" {
  name               = "${title(var.namespace)}LambdaDungeonsAndDiscordBot"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

