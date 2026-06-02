pipeline {
  agent any

  environment {
    BACKEND_IMAGE = 'pratice-backend'
    FRONTEND_IMAGE = 'pratice-frontend'
    IMAGE_TAG = "${env.BUILD_NUMBER}"
    BACKEND_MANIFEST = 'k8s/backend.yaml'
    FRONTEND_MANIFEST = 'k8s/frontend.yaml'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Images') {
      steps {
        bat 'docker build -t %BACKEND_IMAGE%:%IMAGE_TAG% -t %BACKEND_IMAGE%:latest backend'
        bat 'docker build -t %FRONTEND_IMAGE%:%IMAGE_TAG% -t %FRONTEND_IMAGE%:latest frontend'
      }
    }

    stage('Validate Docker Compose') {
      steps {
        bat 'docker compose config'
      }
    }

    stage('Terraform Format Check') {
      steps {
        script {
          if (fileExists('terraform-ec2')) {
            bat 'cd terraform-ec2 && terraform fmt -check'
          }

          if (fileExists('terraform')) {
            bat 'cd terraform && terraform fmt -check'
          }

          if (fileExists('terraform-ecs')) {
            bat 'cd terraform-ecs && terraform fmt -check'
          }
        }
      }
    }

    stage('Deploy To Kubernetes') {
      when {
        expression {
          return fileExists(env.BACKEND_MANIFEST) && fileExists(env.FRONTEND_MANIFEST)
        }
      }
      steps {
        bat 'kubectl apply -f %BACKEND_MANIFEST%'
        bat 'kubectl apply -f %FRONTEND_MANIFEST%'
        bat 'kubectl rollout status deployment/backend --timeout=120s'
        bat 'kubectl rollout status deployment/frontend --timeout=120s'
      }
    }
  }

  post {
    success {
      echo 'Pipeline completed successfully.'
      echo 'Frontend should be available at http://localhost:30003 when using Docker Desktop Kubernetes.'
    }

    failure {
      echo 'Pipeline failed. Check the Jenkins console output for the failing stage.'
    }
  }
}
