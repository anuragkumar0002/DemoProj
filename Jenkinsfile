pipeline {
    agent any

    tools {
        jdk 'jdk17'       // Set in Jenkins → Global Tool Configuration
        maven 'maven3'    // Set in Jenkins → Global Tool Configuration
    }

    stages {

        stage('Checkout') {
            steps {
                echo '🔄 Cloning source code...'
                git 'https://github.com/anuragkumar0002/DemoProj.git'  // Your repo
            }
        }

        stage('Build') {
            steps {
                echo '🔧 Running Maven build...'
                sh 'mvn clean compile'
            }
        }

        stage('Unit Tests') {
            steps {
                echo '🧪 Running unit tests...'
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                echo '📦 Packaging application...'
                sh 'mvn package'
            }
        }

        stage('Archive Artifact') {
            steps {
                echo '📁 Archiving built JAR...'
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }

    post {
        success {
            echo '✅ Build pipeline completed successfully.'
        }
        failure {
            echo '❌ Build pipeline failed.'
        }
    }
}
