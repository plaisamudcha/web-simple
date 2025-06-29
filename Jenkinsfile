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
                sh 'docker build -t my-web-cicd .'
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Try to remove the container if it exists, ignore error
                    sh 'docker rm -f my-web || exit 0'
                    // Run new container
                    sh 'docker run -d --name my-web -p 8080:80 my-web-cicd'
                }
            }
        }
    }
}