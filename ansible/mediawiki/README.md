# MediaWiki provision

Installs and configures MediaWiki, with nginx as the web server and
 PostgreSQL as the database.

## Usage

### Set variables

1. *db_server* - The server IP or URL were the Database is hosted
2. *db_name*   - The database name
3. *db_pass*   - The database password
4. *wiki_url*  - The publicly accessible URL of the Wiki

### Run script

```bash
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i "ip_here", -u ubuntu --private-key=~/.ssh/apcela-devops.pem --extra-vars "db_server=mediawiki-onug-stage-euc1-rds.checvoallqkl.eu-central-1.rds.amazonaws.com db_name=test db_pass=1w3r4E2Q wiki_url=wiki.onug.net" playbook.yml
```

## Variables

All variables are located in the `roles/common/defaults/main.yml` file.
 The variables are expressed in this file with the next syntax
 `VAR_NAME: default_value`

### PHP

```yml
PHP_VERSION: 7.2
```

Defines the PHP version used with MediaWiki.

### nginx

```yml
NGINX_CONF_PATH: /etc/nginx/sites-available
```

Defines the path of the configuration files for the web server.

```yml
NGINX_BASE_DIR: /etc/nginx
```

Defines the nginx installation directory.

```yml
NGINX_DEPLOY_DIR: /var/www/html
```

Defines were are going to be placed the files of MediaWiki, and the
 root folder for the nginx configuration.

### MediaWiki

```yml
MEDIAWIKI_VERSION: 1.31
```

Version to be installed

```yml
MEDIAWIKI_RELEASE: 1
```

Specific version release, it should be anything identifying the
 version else than the `x.xx` format. For example `1-rc2`

### PostgreSQL

```yml
DB_SERVER: {{ db_server }}
```

Defines the Database server to be used with the MediaWiki instance.

```yml
DB_PORT: 5432
```

Defines the Database port to be used with the MediaWiki instance.

```yml
DB_NAME: {{ db_name }}
```

Defines the Database name to be used with the MediaWiki instance.

```yml
DB_USER: postgres
```

Defines the user to access the database used with the MediaWiki
 instance.

```yml
DB_PASS: {{ db_pass }}
```

Defines the password for the user of the database.

```yml
DUMP_FILE: mediawiki_db_dump.gz
```

Defines the database dump file name. This file must be in `.gz` format.

## Credentials

The MediaWiki instance will be deployed with the following credentials

User: `Admin`
Password: `F*5m,7hW`
Email: `wikiadmin@onug.com`

*After initialization please change the password and the email to
 working ones.*

> To change the default initialization data, a new database dump must
> be generated and replaced in `roles/common/files`

## Author

This roles were made in 2018 by Mariano Rodríguez at [Flugel.it](1). For ONUG

[1]: https://flugel.it/