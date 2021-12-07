pipeline {
  environment {
    registry = "schhim/jenkins"
    registryCredential = 'docker-hub-credentials'
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
        sh 'echo $registryCredential | docker login -u schhim -p b23d610d-c820-4f8a-964b-7f3db60e1b10'
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
