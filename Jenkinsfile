pipeline {
    agent any

    stages{
        stage("Cloning Github repo to jenkins"){
            steps{
                script{
                    echo 'Cloning the repository...'
                    echo 'Cloning Github repo to Jenkins............'
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-token', url: 'https://github.com/ksanal/first_mlops_project.git']])
                }

                }
            }
        }
        
    }
