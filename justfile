set export 

infraDir := "infra/modules/aws"

login env:
    assume-role login -p {{env}}Terraform

init dir:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt init \
    --terragrunt-working-dir {{infraDir}}/{{dir}}
    
init-all:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt run-all init \
    --terragrunt-working-dir {{infraDir}}

validate dir:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt validate \
    --terragrunt-working-dir {{infraDir}}/{{dir}}

validate-all:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt validate \
    --terragrunt-working-dir {{infraDir}}
    
plan dir:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt plan \
    --terragrunt-working-dir {{infraDir}}/{{dir}}

plan-all:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt run-all \
    plan --terragrunt-working-dir {{infraDir}}
    
apply dir:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt apply \
    -auto-approve \
    --terragrunt-working-dir {{infraDir}}/{{dir}}
    
apply-all:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt run-all apply \
    --terragrunt-working-dir {{infraDir}} \
    --terragrunt-non-interactive

destroy dir:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt destroy \
    -auto-approve \
    --terragrunt-working-dir {{infraDir}}/{{dir}}
    
destroy-all:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt run-all \
    destroy --terragrunt-working-dir {{infraDir}}
    
fmt:
    doppler run \
    --name-transformer tf-var  \
    -- terraform fmt \
    --recursive
    
@init-module dir:
    mkdir -p {{infraDir}}/{{dir}}/env-config/us-east-1
    
    touch {{infraDir}}/{{dir}}/env-config/common.tfvars
    touch {{infraDir}}/{{dir}}/env-config/us-east-1/common.tfvars
    touch {{infraDir}}/{{dir}}/env-config/us-east-1/dev.tfvars
    touch {{infraDir}}/{{dir}}/env-config/us-east-1/prod.tfvars
    touch {{infraDir}}/{{dir}}/_outputs.tf
    touch {{infraDir}}/{{dir}}/_inputs.tf
    touch {{infraDir}}/{{dir}}/_locals.tf
    touch {{infraDir}}/{{dir}}/_data.tf
    touch {{infraDir}}/{{dir}}/_variables.tf
    touch {{infraDir}}/{{dir}}/main.tf
    touch {{infraDir}}/{{dir}}/terragrunt.hcl
    
    echo 'asset_name = "{{dir}}"' >> {{infraDir}}/{{dir}}/env-config/common.tfvars
    echo 'locals {}' >> {{infraDir}}/{{dir}}/_locals.tf
    echo 'environment = "dev"' > {{infraDir}}/{{dir}}/env-config/us-east-1/dev.tfvars
    echo 'environment = "prod"' > {{infraDir}}/{{dir}}/env-config/us-east-1/prod.tfvars
    echo 'include "root" {\n\
    \tpath = find_in_parent_folders()\n\
    }' > {{infraDir}}/{{dir}}/terragrunt.hcl
    @# {{infraDir}}/{{dir}} created.

add app crate:
    cargo add --manifest-path src/{{app}}/Cargo.toml {{crate}}

build-lambdas:
    cargo lambda build \
    --arm64 \
    --release \
    --output-format zip \
    --manifest-path  src/Cargo.toml \
    --lambda-dir infra/modules/aws/lambda/bin/

######### project cmds #########
