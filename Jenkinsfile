pipeline {
    agent any

    environment {
        IMAGE_NAME = 'web-demo'
        CONTAINER_NAME = 'jenkins'
        PORT = '8080'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/plaisamudcha/web-simple.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Remove Old Container') {
            steps {
                script {
                    sh """
                    if docker ps -a --format '{{.Names}}' | grep -Eq '^${CONTAINER_NAME}\$'; then
                        docker rm -f $CONTAINER_NAME
                    fi
                    """
                }
            }
        }

        stage('Run New Container') {
            steps {
                sh "docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME"
            }
        }
    }
}