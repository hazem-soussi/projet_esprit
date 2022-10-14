pipeline {
agent any
    stages {
        
       /* stage('MVN CLEAN'){
            steps {
                echo'clean...'
            }
        }
        
         stage('MVN COMPILE'){
            steps {
                echo'compile...'
                
            }
        }
        
         stage('MVN SONARQUBE'){
            steps {
                echo'sonarqube'
            }
        } */
        // main SATGES
        stage ("Git checkout PLEAASE"){
            steps{
        git branch: 'main', 
            url: 'https://github.com/hazem-soussi/terminators_5arctic1.git'
            }
        
        }
    
        
                stage('Build Project') {
            steps {
                echo "Build our project"
                sh 'mvn package '
            }
        }
        

        
             stage ("unit testing"){
            steps{
                sh "mvn test"
            }
        
        }
    
    
    }

}
