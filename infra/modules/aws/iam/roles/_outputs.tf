output "iam_role_arn_lambda_hello" {
  value = aws_iam_role.lambda_hello.arn
}

output "iam_role_name_lambda_hello" {
  value = aws_iam_role.lambda_hello.name
}
