import? 'just/base.just'
import? 'just/terraform.just'

project := "<DOPPLER_PROJECT>"
infraDir := "infra/modules/aws/"
env := "dev"

fetch:
    curl https://raw.githubusercontent.com/Fomiller/justfiles/refs/heads/main/base.just > just/base.just
    curl https://raw.githubusercontent.com/Fomiller/justfiles/refs/heads/main/terraform.just > just/terraform.just

################################
######### PROJECT CMDS #########
################################

