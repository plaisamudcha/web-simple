pipeline {
    agent any

    environment {
        IMAGE_NAME = 'web-demo'
        CONTAINER_NAME = 'my-web'
        PORT = '5000'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/plaisamudcha/web-simple.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Remove Old Container') {
            steps {
                script {
                    bat """
                    if docker ps -a --format '{{.Names}}' | grep -Eq '^${CONTAINER_NAME}\$'; then
                        docker rm -f $CONTAINER_NAME
                    fi
                    """
                }
            }
        }

        stage('Run New Container') {
            steps {
                bat "docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME"
            }
        }
    }
}