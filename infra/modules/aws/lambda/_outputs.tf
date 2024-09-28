output "lambda_name_hello" {
  value = aws_lambda_function.hello.function_name
}

output "lambda_arn_hello" {
  value = aws_lambda_function.hello.arn
}
