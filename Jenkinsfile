pipeline {
  environment {
    registry = "schhim/jenkins"
    registryCredential = 'docker-hub-credentials'
    dockerImage = ''
      }
  agent any
  stages {
    stage('Build image') {
      steps {
        sh 'docker build -t schhim/jenkins:latest .'
      }
    }

    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }

    stage('push image') {
      steps {
        sh 'docker push schhim/jenkins:latest'
      }
    }

    stage('Deploy') {
      steps {
        sh 'echo this step saved for kubernetes'
      }
    }

  }
  
  post {
    always {
      sh 'docker logout'
    }

  }
}
