pipeline {
    agent any   
    stages {
        stage('CI') {
            steps {
                git 'https://github.com/NathanEid/Booster_CI_CD_Project'
            }
        }
        stage('CD') {
            steps {
                sh "kubectl apply -f deployBoosterApp.yaml"
            }
        }    
    }
}