pipeline {
    agent any
    tools{
        nodejs 'nodejs18'
    }
    stages{
        stage ("Fetch Code from GitHub") {
            git url: 'https://github.com/PriyanshiSarad/nodejs2-Jenkins.git'
        }
        stage ("Build") {
            sh 'npm install'
        }
    }
}