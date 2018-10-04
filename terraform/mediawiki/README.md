# MediaWiki servers deployment

Deploys one EC2 Instance and one PostgreSQL RDS instance to host
 MediaWiki.

## Deployment

To deploy, first change the variables, and then run the
 `terraform init` command.

```bash
export TV_VAR_create_domain="false" # False doesn't create a domain
export TF_VAR_root_domain="apcela.net."
export TF_VAR_hostname="mediawiki-onug"
export TF_VAR_vpc_default="true"
export TF_VAR_vpc_peering="default"
export TF_VAR_author="mariano"
export TF_VAR_purpose="test-onug-mediawiki"
export TF_VAR_profile="stage"
export TF_VAR_aws_profile="apcela"
export TF_VAR_aws_region_alias="euc1"
export TF_VAR_build="4"
export TF_VAR_task="OAS-4"
export TF_VAR_key_name="apcela-devops"
```

```bash
terraform init -backend-config="key=${TF_VAR_hostname}/${TF_VAR_profile}-${TF_VAR_aws_region_alias}/terraform.tfstate" 
```
