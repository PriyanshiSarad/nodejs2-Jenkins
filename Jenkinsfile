def archieve() {
    sh 'npm install'
}
pipeline {
    agent any
    tools{
        nodejs 'nodejs18'
    }
    environment{
        REMOTE_USER='ubuntu'
        REMOTE_IP='172.31.38.201'
        REMOTE_DIR='/home/ubuntu/nodejs2-Jenkins'
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
        stage("Deployment") {
            steps{
                sshagent(['deployServer']) {
                    sh """
                      tar -czf build.tar.gz - ./*| ssh -o StrictHostKeyChecking=no ${env.REMOTE_USER}@${env.REMOTE_IP} "tar -C ${env.REMOTE_DIRECTORY} -xzf"
                    """
                }
            }
        }
    }
}