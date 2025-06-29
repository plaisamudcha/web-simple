pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/plaisamudcha/web-simple.git'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t my-web-cicd .'
      }
    }
    stage('Run Container') {
      steps {
        sh 'docker rm-f my-web || true'

      }
    }
  }
}