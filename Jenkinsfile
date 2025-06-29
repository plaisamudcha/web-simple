pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/plaisamudcha/web-simple.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t my-web-cicd .'
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Try to remove the container if it exists, ignore error
                    bat 'docker rm -f my-web || exit 0'
                    // Run new container
                    bat 'docker run -d --name my-web -p 8080:80 my-web-cicd'
                }
            }
        }
    }
}