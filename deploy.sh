#!/bin/bash

# 스크립트 위치 기준 절대 경로 설정
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 변수 설정
APP_NAME="hello-world"
JAR_FILE="target/hello-world-0.0.1-SNAPSHOT.jar"
DEPLOY_PATH="$SCRIPT_DIR/deploy"
PROFILE=${1:-dev}  # 기본값으로 dev 프로필 사용

# 빌드 및 테스트
echo "Building and testing application.."
if ! mvn clean package; then
    echo "Tests failed! Deployment aborted."
    exit 1
fi

# 디버깅 정보 출력
echo "Current directory: $(pwd)"
echo "Deploy path: $DEPLOY_PATH"

# 배포 디렉토리 생성 및 권한 확인
echo "Creating deployment directory..."
if ! mkdir -p "$DEPLOY_PATH"; then
    echo "Failed to create deployment directory: $DEPLOY_PATH"
    exit 1
fi

if [ ! -w "$DEPLOY_PATH" ]; then
    echo "No write permission for directory: $DEPLOY_PATH"
    exit 1
fi

# 기존 애플리케이션 백업
echo "Checking for existing JAR: $DEPLOY_PATH/$APP_NAME.jar"
if [ -e "$DEPLOY_PATH/$APP_NAME.jar" ]; then
    echo "Found existing JAR file, backing up..."
    if ! mv "$DEPLOY_PATH/$APP_NAME.jar" "$DEPLOY_PATH/$APP_NAME.jar.backup"; then
        echo "Failed to backup existing application"
        exit 1
    fi
    echo "Backup completed successfully"
else
    echo "No existing JAR file found"
fi

# 새 버전 배포
echo "Deploying new version..."
cp $JAR_FILE $DEPLOY_PATH/$APP_NAME.jar

# 애플리케이션 재시작
echo "Restarting application..."
pid=$(pgrep -f $APP_NAME.jar)
if [ ! -z "$pid" ]; then
    kill $pid
fi

# 새 버전 실행 (프로필 지정)
echo "Starting application with $PROFILE profile..."
nohup java -jar -Dspring.profiles.active=$PROFILE $DEPLOY_PATH/$APP_NAME.jar > $DEPLOY_PATH/app.log 2>&1 &

echo "Deployment completed with $PROFILE profile!" 
