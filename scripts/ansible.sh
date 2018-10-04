# Script to automatically populate Ansible command from the information
# given by Terraform

# Deployment variables
USER="ubuntu"
PLAYBOOK_DIR="../../ansible/mediawiki/"

# Terraform variables
DB_ADDRESS="$(terraform output db_address)"
DB_NAME="$(terraform output db_name)"
DB_PASSWORD="$(terraform output db_password)"
WIKI_IP="$(terraform output ec2_instance_public_ip)"
WIKI_URL="$(terraform output wiki_url)"
PRIVATE_KEY="~/.ssh/$(terraform output ssh_key)"

# Ansible call
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i "$WIKI_IP", -u $USER --private-key=$PRIVATE_KEY --extra-vars "db_server=$DB_ADDRESS db_name=$DB_NAME db_pass=$DB_PASSWORD wiki_url=$WIKI_URL" $PLAYBOOK_DIR/playbook.yml
