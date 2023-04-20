def archieve() {
    sh 'rm -rf *.tar.gz'
    sh 'npm install'
    sh 'tar -czf node-$BUILD_NUMBER.tar.gz /var/lib/jenkins/workspace/nodeApp/*'
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
                    archieve()
                }
            }
        }
    }
}