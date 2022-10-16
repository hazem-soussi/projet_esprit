pipeline {
agent any
    
    
        environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "192.168.149.136:8081"
        NEXUS_REPOSITORY = "esprit-app"
        NEXUS_CREDENTIAL_ID = "nexus_auth"
    }
    
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
        
           stage("Publish to Nexus Repository Manager") {
            steps {
                script {
                    pom = readMavenPom file: "pom.xml";
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    artifactPath = filesByGlob[0].path;
                    artifactExists = fileExists artifactPath;
                    if(artifactExists) {
                        echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                        nexusArtifactUploader(
                            nexusVersion: NEXUS_VERSION,
                            protocol: NEXUS_PROTOCOL,
                            nexusUrl: NEXUS_URL,
                            groupId: pom.groupId,
                            version: pom.version,
                            repository: NEXUS_REPOSITORY,
                            credentialsId: NEXUS_CREDENTIAL_ID,
                            artifacts: [
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: artifactPath,
                                type: pom.packaging],
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: "pom.xml",
                                type: "pom"]
                            ]
                        );
                    } else {
                        error "*** File: ${artifactPath}, could not be found";
                    }
                }
            }
        }
        
        
             //stage("6th stage : packaging & deploy stage ") {
    //   steps
        // {
           // sh "mvn clean -DskipTests package deploy:deploy-file -DgroupId=com.esprit.examen -DartifactId=tpAchatProject -Dversion=1.0.0 -DgeneratePom=true -Dpackaging=war -DrepositoryId=esprit-app -Durl=http://192.168.149.136:8081/repository/maven-releases/ -Dfile=target/tpAchatProject-1.0.0.war"
      //  }
//} 
        
            
 //  stage (" Upload War To Nexus " ) {
               // steps {
                   // script {
                    /*nexusArtifactUploader artifacts: [[
                        artifactId: 'tpAchatProject', classifier: '',
                        
                        file: ' target/Timesheet-spring-boot-core-data-jpa-mvc-REST-1-6.0.war',
                      // 'target/tpAchatProject.jar',
                        type: 'jar']], 
                        credentialsId: 'nexus_auth',
                        groupId: 'com.esprit.examen', 
                        nexusUrl: '192.168.149.136:8081', 
                        nexusVersion: 'nexus2', 
                        protocol: 'http',
                        repository: 'esprit_ci_cd', 
                        version: '1.0'*/
                        
                        
                        
                    /*  nexusArtifactUploader artifacts: [[artifactId: 'tpAchatProject', classifier: ''
                                                           , file: 'target/tpAchatProject-1.0.war',
                                                           type: 'war']],
                            credentialsId: 'nexus_auth', 
                            groupId: 'com.esprit.examen',
                            nexusUrl: '192.168.149.136:8081',
                            nexusVersion: 'nexus2', 
                            protocol: 'http', 
                            repository: 'esprit_ci_cd',
                            version: '1.0'*/
                        
                      /*  nexusArtifactUploader artifacts: [[artifactId: 'tpAchatProject',
                                                           classifier: '',
                                                           file: 'target/tpAchatProject-1.0.0.war',
                                                           type: 'war']],
                            credentialsId: 'nexus_auth',
                            groupId: 'com.esprit.examen', 
                            nexusUrl: '192.168.149.136:8081', 
                            nexusVersion: 'nexus2',
                            protocol: 'http',
                            repository: 'esprit-app', 
                            version: '1.0.0'*/
                        
                        
                  /* def mavenPom = readMavenPom file: 'pom.xml'
                    def nexusRepoName = mavenPom.version.endsWith("SNAPSHOT") ? "tpAchatProject-snapshot" : "tpAchatProject-release"
                    nexusArtifactUploader artifacts: [
                        [
                            artifactId: 'tpAchatProject', 
                            classifier: '', 
                            file: "target/tpAchatProject-${mavenPom.version}.war", 
                            type: 'war'
                        ]
                    ], 
                    credentialsId: 'nexus3', 
                    groupId: 'com.esprit.examen', 
                    nexusUrl: '192.168.149.136:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: nexusRepoName, 
                    version: "${mavenPom.version}"
                        */
                        
                        
                        
                   // }
                    
                    
                //}
                
    //    } 
    
    
    }

}

