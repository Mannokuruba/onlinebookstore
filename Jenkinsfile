pipeline{
     agent any
     stages{
        stage("git chechkout"){
          steps{
               git credentialsId: 'Git Cred', url: 'https://github.com/Mannokuruba/onlinebookstore.git'

          }
        }
     }
}
