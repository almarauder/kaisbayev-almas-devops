pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Almas'
        STUDENT_SURNAME = 'Kaisbayev'
        STUDENT_GROUP   = 'IT2-2306'
        STUDENT_ID      = '37388'
        IMAGE_NAME      = 'kaisbayev-almas-devops'
        CONTAINER_NAME  = 'kaisbayev-almas-container'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out source code from GitHub..."
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Building the project..."
                sh '''
                    echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                    echo "Group: ${STUDENT_GROUP}"
                    echo "Student ID: ${STUDENT_ID}"
                    ls -la
                '''
            }
        }

        stage('Test') {
            steps {
                echo "Running tests / checks..."
                sh '''
                    # Check that important files exist
                    test -f Dockerfile
                    test -f docker-compose.yml
                    test -f scripts/kaisbayev_almas_system.sh
                    test -f kaisbayev_almas_info.txt
                    echo "All required files are present. Tests passed!"
                '''
            }
        }

        stage('Docker Build') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Docker Run') {
            steps {
                echo "Running Docker container..."
                sh '''
                    # Remove old container if it exists
                    docker rm -f ${CONTAINER_NAME} || true

                    # Run the container with environment variables
                    docker run --name ${CONTAINER_NAME} \
                        -e STUDENT_NAME=${STUDENT_NAME} \
                        -e STUDENT_SURNAME=${STUDENT_SURNAME} \
                        -e STUDENT_GROUP=${STUDENT_GROUP} \
                        -e STUDENT_ID=${STUDENT_ID} \
                        ${IMAGE_NAME}
                '''
            }
        }
    }

    post {
        always {
            echo "Pipeline finished."
        }
        success {
            echo "Finished: SUCCESS"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
