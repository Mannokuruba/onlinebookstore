pipeline{
     agent any

     environment{
            PATH = "/opt/maven3?bin:$PATH"
     }
     stages{
        stage("git chechkout"){
          steps{
               git credentialsId: 'Git Cred', url: 'https://github.com/Mannokuruba/onlinebookstore.git'

          }
        }
        stage("maven build"){
          steps{
              sh "mvn clean package"
          }
        }

     }   
}
