include "root" {
  path = find_in_parent_folders()
}

dependency "roles" {
    config_path = "../iam/roles"
    mock_outputs_merge_strategy_with_state = "shallow"
    mock_outputs_allowed_terraform_commands = ["validate", "plan", "apply", "destroy"]
    mock_outputs = {
        iam_role_arn_lambda_hello = "arn:aws:iam::123456789012:role/MOCK-FomillerLambda"
    }
}
inputs = {
    iam_role_arn_lambda_hello = dependency.roles.outputs.iam_role_arn_lambda_hello
}

