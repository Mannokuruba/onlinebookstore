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
                sh "mv target/*.war target/mannojob.war"
               }
          }
       //    stage("SonarQube analysis"){
                
        //      steps{
        //           withSonarQubeEnv('sonarqube-9.0.1'){
        //          sh "mvn sonar:sonar"
                    
        //       }
         // }
         //  }
         // stage("publish to s3"){
         //     steps{
         //       s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'mybcuket123', excludedFile: 'target', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: 'target/*.war', storageClass: 'STANDARD', uploadFromSlave: true, useServerSideEncryption: false]], pluginFailureResultConstraint: 'UNSTABLE', profileName: 'mybcuket123', userMetadata: []
         //      }
        // }
          stage("tomcat deploy"){
              steps{
              sshagent(['tomcat-new']) {  
                 sh """
                     scp -o StrictHostKeyChecking=no target/mannojob.war ec2-user@172.31.81.233:/opt/tomcat/webapps
                     ssh ec2-user@172.31.81.233 /opt/tomcat/bin/shutdown.sh
                     ssh ec2-user@172.31.81.233 /opt/tomcat/bin/startup.sh
                       
                     """
              }  
              
            

            }
            
         }
         stage('Deploy'){
      agent { label 'tomcat '}
      steps{
        sh label: '', script: '''rm -rf dockerimg
mkdir dockering
cd dockering
cp  /home/manoj/workspace/cicd/target/*.war .
touch Dockerfile
cat <<EOT>>Dockerfile
FROM tomcat
ADD mannojob.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
EXPOSE 8080
EOT
docker build -t webimage:$BUILD_NUMBER .
docker container run -itd --name webserver$BUILD_NUMBER -p 8080 webimage:$BUILD_NUMBER'''
     }
  }
      }
}
