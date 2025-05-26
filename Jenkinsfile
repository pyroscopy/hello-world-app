pipeline {
    agent any

    options {
        // 빌드 전 워크스페이스 삭제
        skipDefaultCheckout()
        cleanBeforeCheckout()
    }

    tools {
        // Jenkins에 등록한 이름과 일치해야 함
        jdk 'JDK 17'
        maven 'Maven 3.8.6'
    }

    stages {
        stage('Checkout') {
            steps {
                // 깨끗한 워크스페이스에서 시작
                cleanWs()
                // 소스 코드 체크아웃
                checkout scm
            }
        }
        stage('Build') {
            steps {
                // Maven 빌드
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                // 테스트 실행
                sh 'mvn test'
            }
            post {
                always {
                    // 테스트 결과 리포트
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }

    post {
        always {
            // 빌드 후 워크스페이스 정리
            cleanWs()
        }
    }
}
