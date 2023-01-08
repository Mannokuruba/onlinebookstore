pipeline{
     agent any

     environment{
            PATH = "/opt/maven/bin:$PATH"
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
