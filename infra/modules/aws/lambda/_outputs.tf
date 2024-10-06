output "lambda_name_hello" {
  value = aws_lambda_function.hello.function_name
}

output "lambda_arn_hello" {
  value = aws_lambda_function.hello.arn
}

output "lambda_invoke_arn_hello" {
  value = aws_lambda_function.hello.invoke_arn
}

