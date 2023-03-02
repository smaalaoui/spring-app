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

        stage('Run Unit Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Artifact') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }

        /*stage('Deploy Artifact to AWS EC2') {
            steps {
            // Set up SSH agent with private key
            sshagent(['my-ssh-key']) {
                // SSH into EC2 instance
                ssh remote: "ec2-user@my-ec2-instance.compute.amazonaws.com", user: "ec2-user", port: 22, allowAllHosts: true, knownHostsFile: '/dev/null', failOnError: true, command: '''
                # Stop the existing application
                sudo systemctl stop my-application.service

                # Remove the existing JAR file
                sudo rm /opt/my-application/my-application.jar

                # Copy the new JAR file over
                sudo scp -o StrictHostKeyChecking=no target/my-application.jar ec2-user@my-ec2-instance.compute.amazonaws.com:/opt/my-application/

                # Start the new application
                sudo systemctl start my-application.service
            '''

    }
}


        stage('Run Newman Collection') {
            steps {
                sh 'newman run mycollection.json --env-var "baseURL=https://example.com" --env-var "apiKey=12345"'
            }
        }
    }  }*/
    }
}
