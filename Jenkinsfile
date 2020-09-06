pipeline {
    agent {
        label 'dockerslave'
    }

    stages {
        stage('Preparation') {
            steps {
                // Repo is automatically  checked out
                sh 'docker stop BoosterCICD || true'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t digitalphoenixx/boostercicd:latest . '
            }
        }
        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(credentialsId:"DockerHub",
                                usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]){
                    sh 'docker login --username $USERNAME --password $PASSWORD'
                    sh 'docker push digitalphoenixx/boostercicd:latest'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run --rm -d -p 8000:8000 --name BoosterCICD digitalphoenixx/boostercicd:latest'
            }
        }
    }
    post {
        success {
            slackSend (color: '#00FF00',
             message: "SUCCESSFUL: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
        }
        failure {
            slackSend (color: '#ff0000',
             message: "FAILURE: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
        }
        aborted {
            slackSend (color: '#fffb00',
             message: "ABORTED: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
        }
    }
}
