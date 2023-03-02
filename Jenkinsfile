def HOST_IP = "34.243.136.237"

pipeline {
    agent { label "master" }

    tools {
        maven "maven-3.6.0"
    }

    stages {

        stage("Clean") {
            steps {
                deleteDir()
            }
        }

        stage('Clone') {
            steps {
                checkout scm
            }
        }

        /*stage('Run Unit Tests') {
            steps {
                sh 'mvn test'
            }
        }*/

        stage('Build Artifact') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }

        stage('Deploy Artifact to AWS EC2') {
            steps {
                script {
                    sshagent(credentials: ['my-key-pair']) {
                        sh """
                            scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null .scripts/01-undeploy.sh ubuntu@${HOST_IP}:/home/ubuntu
                            scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null .scripts/02-deploy.sh ubuntu@${HOST_IP}:/home/ubuntu
                            scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null target/app.war ubuntu@${HOST_IP}:/home/ubuntu
                            ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@${HOST_IP} "chmod +x /home/ubuntu/01-undeploy.sh /home/ubuntu/02-deploy.sh"
                            ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@${HOST_IP} "/home/ubuntu/01-undeploy.sh"
                            ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@${HOST_IP} "/home/ubuntu/02-deploy.sh"
                        """
                    }
                }
            }
        }


        /* stage('Run Newman Collection') {
             steps {
                 sh 'newman run mycollection.json --env-var "baseURL=https://example.com" --env-var "apiKey=12345"'
             }
         }
     }  }*/
    }
}
