locals {
  source_code_hash = {
    hello = fileexists("${path.module}/bin/hello/bootstrap.zip") ? filebase64sha256("${path.module}/bin/hello/bootstrap.zip") : data.aws_lambda_function.hello_exists[0].source_code_hash
  }
}
