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
    
        
                stage('Maven Build Project') {
            steps {
                echo "Build our project"
                sh 'mvn clean install '
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
        
        stage ("Static code analysis WITH SONARQUBE"){
            steps {
            
            withSonarQubeEnv(credentialsId: 'sonar-api') {
                // some block
                sh "mvn clean package sonar:sonar"
}
            }
            
        
        }
    
    
    }

}
