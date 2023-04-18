def Cmd() {
    sh 'npm install'
}
def deploy() {
    sh './deploy_script.sh'
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
            steps{
                script {
                    deploy()
                }
            }
        }
    }
}