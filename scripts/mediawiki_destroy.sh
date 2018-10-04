source "${BASH_SOURCE%/*}/variables.sh"

# Terraform deployment
cd "terraform/mediawiki"
terraform destroy
