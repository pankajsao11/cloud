pipeline {
    agent any
    stages {
        stage("Clean Up"){
            steps {
                deleteDir()
            }
        }
        stage("Clone Repo"){
            steps {
                sh "git clone https://github.com/jenkins-docs/simple-java-maven-app.git"
            }
        }
        stage("Build"){
            steps {
                dir("simple-java-maven-app") {
                    sh "mvn clean install"
                }
            }
        }
        stage("Test"){
            steps {
                dir("simple-java-maven-app") {
                    sh "mvn test"
                }
            }
        }
    }
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Env-variable
pipeline {
    agent any
    stages {
        stage("Clean Up"){
            steps {
                echo "Build number: ${env.BUILD_NUMBER}"
            }
        }
    }
}


-------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Jenkins Pipeline script for Terraform CI/CD

pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/your-org/your-terraform-repo.git' // Replace with your repository URL
        BRANCH = 'main' // Replace with your branch name
        TF_VAR_aws_access_key = credentials('AWS_ACCESS_KEY') // AWS Access Key (stored in Jenkins Credentials)
        TF_VAR_aws_secret_key = credentials('AWS_SECRET_KEY') // AWS Secret Key (stored in Jenkins Credentials)
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    // Clone the Terraform code from GitHub
                    git branch: BRANCH, url: GIT_REPO
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Generate and display the Terraform execution plan
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression {
                    // Run terraform apply only for non-PR environments or specific conditions
                    return params.APPLY_CHANGES == true
                }
            }
            steps {
                script {
                    // Apply the Terraform changes
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace after execution
            cleanWs()
        }
        success {
            echo 'Terraform pipeline executed successfully!'
        }
        failure {
            echo 'Terraform pipeline failed. Please check logs!'
        }
    }
}
