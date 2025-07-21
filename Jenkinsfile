pipeline {
    agent any

    tools {
        jdk 'jdk17'       // Make sure this is configured under Jenkins → Global Tools
        maven 'maven3'    // Same here
    }

    environment {
        SONAR_TOKEN = credentials('squ_7c5c079a6b31e5385caf3f6c35de25966373a91e') // Create Jenkins credential with your Sonar token
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Cloning source code...'
                git 'https://github.com/anuragkumar0002/DemoProj.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Running Maven build...'
                sh 'mvn clean compile'
            }
        }

        stage('Unit Tests') {
            steps {
                echo 'Running JUnit tests...'
                sh 'mvn test'
            }
        }

        stage('Code Quality - SonarQube') {
            environment {
                SONARQUBE_ENV = 'SonarQubeServer'
            }
            steps {
                withSonarQubeEnv("${SONARQUBE_ENV}") {
                    sh "mvn sonar:sonar -Dsonar.login=${SONAR_TOKEN}"
                }
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline executed successfully.'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}
