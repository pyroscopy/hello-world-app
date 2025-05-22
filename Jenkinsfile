pipeline {
    agent any

    tools {
        // Jenkins에 등록한 이름과 일치해야 함
        jdk 'JDK 17'
        maven 'Maven 3.8.6'
    }

    stages {
        stage('Checkout') {
            steps {
                // Git 저장소에서 코드 가져오기
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
        // 필요하다면 배포 단계 추가
        // stage('Deploy') {
        //     steps {
        //         sh './deploy.sh'
        //     }
        // }
    }
}
