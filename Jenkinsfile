pipeline{
     agent { label 'tomcat '}
     environment {
           PATH = "/opt/maven/bin/:$PATH"
     }
      stages{    
          stage("git chechkout"){
              steps{
                git credentialsId: 'Git Cred', url: 'https://github.com/Mannokuruba/onlinebookstore.git'
               }
          }   
          
          stage("maven build"){
              steps{
                sh "mvn clean install"
                sh "mv target/*.war target/mannoadith2.war"
               }
          }
           stage("SonarQube analysis"){
                
              steps{
                   withSonarQubeEnv('sonarqube-9.0.1'){
                  sh "mvn sonar:sonar"
                    
               }
          }
           }
          stage("publish to s3"){
              steps{
                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'mybcuket123', excludedFile: 'target', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: 'target/*.war', storageClass: 'STANDARD', uploadFromSlave: true, useServerSideEncryption: false]], pluginFailureResultConstraint: 'UNSTABLE', profileName: 'mybcuket123', userMetadata: []
               }
         }
          stage("tomcat deploy"){
              steps{
              sshagent(['tomcat-new']) {  
                 sh """
                     scp -o StrictHostKeyChecking=no target/mannoadith2.war ec2-user@172.31.81.233:/opt/tomcat/webapps
                     ssh ec2-user@172.31.81.233 /opt/tomcat/bin/shutdown.sh
                     ssh ec2-user@172.31.81.233 /opt/tomcat/bin/startup.sh
                       
                     """
              }  
              
            

            }
            
         } 
     }
  }


