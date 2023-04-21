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
                script{
                  sh """
                    tar -czf - app.js ecosystem.config.js node_modules package-lock.json package.json deploy_script.sh | ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_IP} "tar -C ${REMOTE_DIR} -xzf -"
                    ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_IP} "cd ${REMOTE_DIR} && ./deploy_script.sh"
                  """
                }
            }
        }
    }
}