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
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'docker-hub-credentialsPassword', usernameVariable: 'docker-hub-credentialsUser')]) {
          sh 'docker login -u ${env.docker-hub-credentialsUser} -p ${env.docker-hub-credentialsPassword}'
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
}
