# Jenkins servers deployment

To deploy, first change the variables, and then run the
 `terraform init` command.

```bash
export TF_VAR_hostname="jenkins-onug"
export TF_VAR_vpc_default="true"
export TF_VAR_vpc_peering="VPC-Peering"
export TF_VAR_author="mariano"
export TF_VAR_purpose="test-onug-jenkins"
export TF_VAR_profile="stage"
export TF_VAR_aws_region_alias="euc1"
export TF_VAR_build="4"
export TF_VAR_task="OAS-4"
```

```bash
terraform init -backend-config="key=${TF_VAR_hostname}/${TF_VAR_profile}-${TF_VAR_aws_region_alias}/terraform.tfstate" 
```