pipeline {
  agent any
  stages {
    stage('Build image') {
      steps {
        sh 'dockerImage = docker.build registry + ":$BUILD_NUMBER" .'
      }
    }

    stage('Login') {
      steps {
        sh 'docker.withRegistry( '', registryCredential ) {
            dockerImage.push()'
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
  environment {
    registry = "schhim/jenkins"
    registryCredential = 'docker-hub-credentials'
    dockerImage = ''
      }
  post {
    always {
      sh 'docker logout'
    }

  }
}
