pipeline {
  agent any
  stages {
    stage('Build image') {
      steps {
        sh 'docker build -t schhim/jenkins:latest .'
      }
    }

    stage('Login') {
      steps {
        sh 'echo $registryCredential| docker login -u schhim --password-stdin'
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
      }
  post {
    always {
      sh 'docker logout'
    }

  }
}
