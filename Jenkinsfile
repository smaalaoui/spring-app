

pipeline {
    agent { label "master" }

    tools {
        maven "maven-3.6.0"
    }

    parameters {
        string(name: 'HOST_IP', defaultValue: '54.154.198.55', description: 'Deployment server IP.')
        string(name: 'DELETE_ID', defaultValue: '1', description: 'Hotel ID for deletion test.')
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

        stage('Deploy & Run App') {
            steps {
                script {
                    sshagent(credentials: ['my-key-pair']) {
                        sh """
                            scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null .scripts/01-undeploy.sh ubuntu@${params.HOST_IP}:/home/ubuntu
                            scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null .scripts/02-deploy.sh ubuntu@${params.HOST_IP}:/home/ubuntu
                            scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null target/app.war ubuntu@${params.HOST_IP}:/home/ubuntu
                            ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@${params.HOST_IP} "chmod +x /home/ubuntu/01-undeploy.sh /home/ubuntu/02-deploy.sh"
                            ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@${params.HOST_IP} "/home/ubuntu/01-undeploy.sh"
                            ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@${params.HOST_IP} "/home/ubuntu/02-deploy.sh"
                        """
                    }
                }
            }
        }


        stage('Run API Tests') {
            steps {
                sh '''
                newman run Test_API_Collection.postman_collection.json --env-var 'HOST_URL=http://54.154.198.55:8090' --env-var 'DELETE_ID=2'
                '''
            }
        }
    }
}

