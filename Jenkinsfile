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
                sh "mv target/*.war target/myweb.war"
               }
          }
          stage("tomcat deploy"){
              steps{
              sshagent(['tomcat-new']) {
                 sh """
                     scp -o StrictHostKeyChecking=no target/myweb.war ec2-user@44.211.191.236:/opt/tomcat/webapps
                     ssh ec2-user@44.211.191.236 /opt/tomcat/bin/shutdown.sh
                     ssh ec2-user@44.211.191.236 /opt/tomcat/bin/startup.sh
                     
                     """
                     
              }


            }
         }
        
      }
}

