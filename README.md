# reference_workload_wikimedia
A baseline application to deploy for ONUG projects / proof of concepts

The intent of ONUG is to select a sample application to build and operate in a variety of different contexts.  Our two intial contexts are for the working groups
* Monitoring and Analytics (M&A or MA)
* Software Defined Security Service (SDSS)


## Acknowledgements of open source code:
We started here at the base WikiMedia dowload libraries, freely dowloadable under GNU General Pulbic License.
https://www.mediawiki.org/wiki/Download

### Requirements

* [Terraform](1) v0.11.8
* [Ansible](2) v2.6.4
* [AWS-CLI](3) configured with the AWS Credentials.
* The SSH key to be used registered in AWS and in the machine running
 the scripts, with the same name it has in AWS.

### Basic Steps

1. Change the server and AWS variables in `scripts/mediawiki_deploy.sh`
2. If necessary change the server access variables in
 `scripts/ansible.sh`
3. If necessary change the Terraform backend information in `/terraform/mediawiki/must-have.tf`
4. Make the scripts executables `chmod -R +x scripts/`
5. Run the command `./scripts/mediawiki_deploy.sh`

### More information about the deployment can be found at

* `ansible/mediawiki/README.md`
* `terraform/mediawiki/README.md`

### Detailed Example Steps

* Bring you from the ground-up on a brand-new ubuntu 16.04 server
```
# update apt-get
sudo apt-get update

# install / upgrade pip
sudo apt-get install python-pip
pip install --upgrade pip

# install awscli
pip install awscli --user

wrgeorge1983@ubuntu-s-2vcpu-4gb-nyc1-01:~$ aws configure --profile apcela
AWS Access Key ID [None]: AKINOTAREALACCESSKEYIDQ
AWS Secret Access Key [None]: NOTAREALSECRETEACCESSKEY
Default region name [None]: us-east-1
Default output format [None]: 

# create s3 bucket to use (if not using an existing one), keep track of the name ('apcela-terraform') in this instance
s3 mb apcela-terraform --profile apcela

# install ansible
pip install ansible

# install terraform
sudo apt-get install unzip

wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
unzip terraform_0.11.8_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform --version 

# pull repo
git clone  https://github.com/onug/reference_workload_wikimedia.git

# update configs
cd onug
vi scripts/mediawiki_deploy.sh
    export TF_VAR_aws_profile="apcela" # profile name from configuring AWS CLI
    edit aws_region_alias to use1 # us-east-1

vi terraform/mediawiki/must-have.tf
    edit terraform.backend "s3".bucket # to bucket created earlier
    edit terraform.backend "s3".profile # to aws cli profile created earlier


# execute
./scripts/mediawiki_deploy.sh

# destroy (Important! Especially if you don't intend to keep paying for this)
./scripts/mediawiki_destroy.sh
```

## Existing content is available on Wikimedia Dump page:
https://dumps.wikimedia.org/

## There is a partnership between Wikimedia and Kubernetes to make management of wikis easier around the workd
https://kubernetes.io/case-studies/wikimedia/


## Versioning

This repository follows [Semantic Versioning](5) as the versioning
 scheme.

## Author

This repository was made in 2018 by Mariano Rodríguez at [Flugel.it](4). For ONUG  
Additional contributions by William George at [Apcela](6). 


[1]: https://www.terraform.io/intro/getting-started/install.html
[2]: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
[3]: https://docs.aws.amazon.com/cli/latest/userguide/installing.html
[4]: https://flugel.it/
[5]: https://semver.org/
[6]: https://apcela.com/
