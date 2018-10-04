pipeline {
    agent any
    stages {
        stage('Clone repo') {
            steps {
                sh 'rm -rf onug'
                sh 'git clone git@bitbucket.org:flugel-it/onug.git'
            }
        }
        stage('Make scripts executable') {
            steps {
                sh 'chmod +x onug/scripts/variables.sh'
                sh 'chmod +x onug/scripts/ansible.sh'
            }
        }
        stage('Deploy and provision Infrastructure') {
            steps {
                dir('onug/terraform/mediawiki') {
                    sh './../../scripts/variables.sh'
                    sh 'terraform plan'
                    sh 'terraform apply'
                    sh './../../scripts/ansible.sh'
                }
            }
        }
    }
}
