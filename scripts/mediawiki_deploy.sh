# Export Terraform variables to do the Terraform init

source "${BASH_SOURCE%/*}/variables.sh"

# Terraform deployment
cd "terraform/mediawiki"
terraform init -backend-config="key=${TF_VAR_hostname}/${TF_VAR_profile}-${TF_VAR_aws_region_alias}/terraform.tfstate"
terraform apply

# Ansible provisioning
./../../scripts/ansible.sh
