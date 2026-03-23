pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/teja1612-fr/infra-project.git'
            }
        }

        stage('Build AMI') {
            steps {
                dir('packer') {
                    sh 'packer init .'
                    sh 'packer build base-ami.pkr.hcl'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
