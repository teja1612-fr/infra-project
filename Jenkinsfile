pipeline {
    agent any

    stages {

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
            sh '''
            terraform destroy -auto-approve || true
            terraform apply -auto-approve
            '''
        }
    }
}
    }
}
