pipeline {
    agent { label "slave" }
    stages {
        stage('CI') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh "docker build . -t ${USER}/booster:v1"
                    sh "docker login -u ${USER} -p ${PASS}"
                    sh "docker push ${USER}/booster:v1"
                }
            }
        }
        stage('CD') {
            steps {
                sh "kubectl apply -f deployBoosterApp.yaml"
            }   
        }
    }
}
