def Cmd() {
    sh 'npm install'
}
pipeline {
    agent any
    tools{
        nodejs 'nodejs18'
    }
    stages{
        stage ("Fetch Code from GitHub") {
            steps{
                git url: 'https://github.com/PriyanshiSarad/nodejs2-Jenkins.git'
            }
        }
        stage ("Build") {
            steps{
                script {
                    Cmd()
                }
            }
        }
        stage ("Deploying on deployment server") {
            sshagent(['deployServer']) {
               sh 'ssh ubuntu@172.31.38.201'
               sh 'scp -r /var/lib/jenkins/workspace/nodeApp/* ubuntu@172.31.38.201:/home/ubuntu/nodejs2-Jenkins'
            }
        }
    }
}