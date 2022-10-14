pipeline {
agent any
    stages {
        

        // main SATGES
        stage ("Git checkout PLEAASE"){
            steps{
        git branch: 'main', 
            url: 'https://github.com/hazem-soussi/projet_esprit.git'
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
        
        stage ("Integration testing"){
            
                steps {
                sh "mvn verify -DskipUnitTests"
                
                }
            }
    
    
    }

}
