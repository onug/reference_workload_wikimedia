# Jenkins provision

Installs and configure Jenkins.

## Usage

### Set variables

1. *hostname* - The URL or IP were jenkins is going to be accessed.

### Run script

> Before running the script you need to know the `vault` password

```bash
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i "hostname", -u ubuntu --private-key=~/.ssh/apcela-devops.pem --extra-vars "hostname=localhost" --ask-vault-pass playbook.yml
```

## Variables

### Git

```yml
GIT_KEY:
```

The Git key must be added to `roles/common/files` **before** running
 the script, and the file name added to the variable.

### Jenkins

```yml
jenkins_version: "2.143"
```

Defines the Jenkins version to be installed.

```yml
jenkins_package_state: present
```

Defines if Jenkins must be updated if a new version is available. To
 expect this behavior, the variable must be set to `latest`

### Server

```yml
jenkins_http_port: 8080
```

Defines the port where jenkins is going to be accessible from.

```yml
jenkins_ssh_key_name: apcela-devops.pem
```

Defines the name of the SSH Key to use to connect to the AWS Instances.
 The key must be placed in `roles/jenkins/files/`.

> It's recommended the key to be vaulted for safety.

### Plugins

```yml
jenkins_plugins: []
```

List of Jenkins plugins to be installed *(default plugins installed
 not listed)*

## Credentials

The Jenkins instance will be deployed with the following credentials

User: `admin`
Password: `Aj}v%D8Ts]`

> To change this initialization data, just change the defaults file in
> `roles/jenkins/defaults/main.yml`

## Known Issues

Sometimes some plugins fail to install due to `Connection failure: timed out`

## Author

This roles were made in 2018 by Mariano Rodríguez at [Flugel.it](1). For ONUG

[1]: https://flugel.it/