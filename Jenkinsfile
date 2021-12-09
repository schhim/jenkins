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
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
          sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
      }
    }
    }
    stage('push image') {
      steps {
        sh 'docker push schhim/jenkins:latest'
      }
    }

    stage('Deploy') {
      stage ('K8S Deploy') {
            steps {
                withKubeConfig([credentialsId: 'K8s']) {
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl rollout restart deployment maven-app-deploy'
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
