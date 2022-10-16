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
        
        stage ("SONARQUBE Analysis"){
            steps {
            echo 'Analzying quality code.'
                script {
                    withSonarQubeEnv(credentialsId: 'sonar_hazoum', installationName: 'sonarqube_server') {
           // withSonarQubeEnv(credentialsId: 'hazem_esprit') {
               // sh "mvn clean package sonar:sonar" 
                  sh "mvn clean package sonar:sonar" 

                 }
                }
              }
            
        }
     
        // ********************************** 
        
        stage ('Quality Gate Status'){
            steps {
                script{
                    withSonarQubeEnv(credentialsId: 'sonar_hazoum', installationName: 'sonarqube_server') {
                //    withSonarQubeEnv(credentialsId: 'hazem_esprit') {
    // some block
                    }
                
                
                }
            
            }
        }
            
   stage (" upload war file to nexus " ) {
                steps {
                    script {
                    nexusArtifactUploader artifacts: [[
                        artifactId: 'tpAchatProject', classifier: '',
                        
                        file: ' target/Timesheet-spring-boot-core-data-jpa-mvc-REST-1-6.0.war',
                      // 'target/tpAchatProject.jar',
                        type: 'jar']], 
                        credentialsId: 'nexus_auth',
                        groupId: 'com.esprit.examen', 
                        nexusUrl: 'localhost:8081', 
                        nexusVersion: 'nexus2', protocol: 'http',
                        repository: 'esprit_ci_cd', 
                        version: '1.0'
                    }
                    
                    
                }
                
        }
    
    
    }

}

