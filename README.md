# aws-repo-template
Template for initializing repos that deploy aws infrastructure.
This template will create a "hello world" lambda using Rust with an associated IAM role and
Cloudwatch log group.  


## Inital setup
```
doppler -p {project_name} -c {config_name}
```
- Update local.project_name in root terragrunt.hcl file
- Update doppler-project variable in deploy.yaml
- To add new modules use the just command
```
just init-module <module name>
```
- Available Just recipes:
```
add app crate
apply dir
apply-all
build-lambdas
destroy dir
destroy-all
fmt
init dir
init-all
init-module dir
login env
plan dir
plan-all
validate dir
validate-all
```

## Before running pipeline for the first time
- Create at least a `dev` and a `prod` environment in the projects repo.
- Make sure a new Doppler project is setup and synced with the repo.

## After initial configuration
- You might want to edit the src-filters on the Build-Rust-Lambdas job in the deploy.yaml

## Notes
- `src/` uses Rust workspaces. To add a new lambda,`cd src && cargo lambda new <lambda>`.
- to quickly edit all references to `hello` related resources. 
**Not tested but should get you close.**
```
:args **/*.tf **/*.hcl
:argdo %s/hello/<lambda name>/g
:wa
```
