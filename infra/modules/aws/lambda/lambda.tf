resource "aws_lambda_function" "hello" {
  function_name    = "${var.namespace}-${var.app_prefix}-bot"
  role             = var.iam_role_arn_lambda_hello
  handler          = "bootstrap"
  filename         = "${path.module}/bin/bot/bootstrap.zip"
  source_code_hash = local.source_code_hash["hello"]
  runtime          = "provided.al2"
  architectures    = ["arm64"]
  memory_size      = 128
  timeout          = 10
  environment {
    variables = {
      REGION  = data.aws_region.current.name
      ACCOUNT = data.aws_caller_identity.current.account_id
    }
  }
}

