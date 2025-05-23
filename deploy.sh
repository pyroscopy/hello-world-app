#!/bin/bash

# 변수 설정
APP_NAME="hello-world"
JAR_FILE="target/hello-world-0.0.1-SNAPSHOT.jar"
DEPLOY_PATH="./deploy"
PROFILE=${1:-dev}  # 기본값으로 dev 프로필 사용

# 1. Maven 빌드
echo "1. Maven 빌드 시작..."
if ! mvn clean package; then
    echo "빌드 실패! 배포를 중단합니다."
    exit 1
fi
echo "Maven 빌드 완료"

# 2. 기존 JAR 파일 백업
echo "2. 기존 JAR 파일 백업..."
if [ -e "$DEPLOY_PATH/$APP_NAME.jar" ]; then
    if ! mv "$DEPLOY_PATH/$APP_NAME.jar" "$DEPLOY_PATH/$APP_NAME.jar.backup"; then
        echo "백업 실패! 배포를 중단합니다."
        exit 1
    fi
    echo "기존 JAR 파일 백업 완료"
else
    echo "백업할 기존 JAR 파일이 없습니다."
fi

# 3. 새 버전 배포
echo "3. 새 버전 배포..."
if ! cp "$JAR_FILE" "$DEPLOY_PATH/$APP_NAME.jar"; then
    echo "새 버전 배포 실패! 배포를 중단합니다."
    exit 1
fi
echo "새 버전 배포 완료"

# 4. 완료 메시지
echo "4. 배포 완료!"
echo "프로필: $PROFILE"
echo "배포 경로: $DEPLOY_PATH/$APP_NAME.jar"
echo "백업 파일: $DEPLOY_PATH/$APP_NAME.jar.backup" 
