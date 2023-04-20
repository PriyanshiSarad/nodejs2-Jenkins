def archieve() {
    sh 'rm -rf *.tar.gz'
    sh 'npm install'
    sh 'tar -czf node.tar.gz *'
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
        stage("Deployment") {
            steps{
                sshPublisher(publishers: [sshPublisherDesc(configName: 'deploy1', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*.tar.gz')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
    }
}