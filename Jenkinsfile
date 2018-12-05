def awesomeVersion = 'UNKNOWN'

pipeline {
    agent {
        label 'jenkins-slave'
    }
    stages {
        stage('Build') {
            steps {
                sh 'chmod 755 commands'
                sh './commands'
            }
            
        }
        stage('test') {
            steps {
                sh 'docker pull pranjalborthakur/mmp:python03'
                
                script {
                   awesomeVersion = sh(returnStdout: true, script: 'docker run -d -p 80 pranjalborthakur/mmp:python03')
                   
                } 
                
               echo "awesomeVersion: ${awesomeVersion}"
               
               input 'Ready to go'
                
                
                 }
             
            }
            
            
        stage('Deploy') {
            steps {
                sh 'cat ~/my_password.txt | docker login -u pranjalborthakur --password-stdin'
                sh 'docker pull pranjalborthakur/mmp:python03'
                sh 'docker run -it -d pranjalborthakur/mmp:python03'
            }
             
        }
    }
    post {
      always {
        cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: 'coverage.xml', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false
      }
   } 
}
