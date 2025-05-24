# Hello World 애플리케이션

이 프로젝트는 배포 실습을 위한 간단한 Spring Boot 애플리케이션입니다.

## 요구사항..

### Java 환경
- **개발 환경 (JDK 17 필요)**
  - Java Development Kit (JDK) 17 이상
  - 컴파일러, 디버거 등 개발 도구 포함
  - Maven 빌드 및 테스트 실행에 필요

- **실행 환경 (JRE 17 필요)**
  - Java Runtime Environment (JRE) 17 이상
  - JAR 파일 실행에 필요
  - JDK 설치 시 자동 포함

## JDK 17 설치 방법

### macOS
```bash
# Homebrew를 사용한 설치
brew install openjdk@17

# 심볼릭 링크 생성 (필요한 경우)
sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

# 설치 확인
java -version
javac -version

# JAVA_HOME 환경 변수 설정
echo 'export JAVA_HOME=$(/usr/libexec/java_home -v 17)' >> ~/.zshrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
source ~/.zshrc
```

### Linux (Ubuntu/Debian)
```bash

# 저장소 추가
sudo apt update
sudo apt upgrade -y

# JDK 17 설치
sudo apt install openjdk-17-jdk -y

# 설치 확인
java -version
javac -version

# JAVA_HOME 환경 변수 설정
echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### Windows
1. [Oracle JDK 다운로드 페이지](https://www.oracle.com/java/technologies/downloads/#java17)에서 JDK 17 다운로드
2. 설치 프로그램 실행
3. 환경 변수 설정:
   - `JAVA_HOME`: JDK 설치 디렉토리 (예: `C:\Program Files\Java\jdk-17`)
   - `PATH`: `%JAVA_HOME%\bin` 추가
4. 설치 확인:
   - 명령 프롬프트에서 `java -version` 실행
   - 명령 프롬프트에서 `javac -version` 실행

### 설치 확인
```bash
# Java 버전 확인
java -version

# Java 컴파일러 버전 확인
javac -version

# JAVA_HOME 환경 변수 확인
echo $JAVA_HOME  # Unix/Linux/macOS
echo %JAVA_HOME% # Windows
```

## Maven 설치 방법

### macOS
```bash
# Homebrew를 사용한 설치
brew install maven

# 설치 확인
mvn -version

# MAVEN_HOME 환경 변수 설정
echo 'export MAVEN_HOME=/opt/homebrew/opt/maven' >> ~/.zshrc
echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> ~/.zshrc
source ~/.zshrc

# macOS에서 정확한 Maven 설치 경로 확인
brew info maven
```

### Linux (Ubuntu/Debian)
```bash
# apt를 사용한 설치
sudo apt update
sudo apt install maven -y

# 설치 확인
mvn -version

# MAVEN_HOME 환경 변수 설정
echo 'export MAVEN_HOME=/usr/share/maven' >> ~/.bashrc
echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Linux에서 정확한 Maven 설치 경로 확인
dpkg -L maven
```

### Windows
1. [Maven 공식 웹사이트](https://maven.apache.org/download.cgi)에서 최신 버전 다운로드
2. 다운로드한 파일을 원하는 디렉토리에 압축 해제
3. 환경 변수 설정:
   - `MAVEN_HOME`: Maven 설치 디렉토리 (예: `C:\Program Files\Apache\maven`)
   - `PATH`: `%MAVEN_HOME%\bin` 추가
4. 설치 확인:
   - 명령 프롬프트에서 `mvn -version` 실행
   - 명령 프롬프트에서 `echo %MAVEN_HOME%` 실행

### Maven 환경 변수 확인
```bash
# Maven 버전 확인
mvn -version

# MAVEN_HOME 환경 변수 확인
echo $MAVEN_HOME  # Unix/Linux/macOS
echo %MAVEN_HOME% # Windows
```

## 유용한 링크

- [Maven 공식 문서](https://maven.apache.org/guides/)
- [Spring Boot 가이드](https://spring.io/guides)
- [Maven Central Repository](https://search.maven.org/)
- [Spring Boot 프로필 설정 가이드](https://docs.spring.io/spring-boot/docs/current/reference/html/features.html#features.profiles)

## Jenkins 설치 방법

### macOS
```bash
# Homebrew를 사용한 설치
brew install jenkins

# Jenkins 서비스 시작
brew services start jenkins

# Jenkins 서비스 상태 확인
brew services list

# 초기 관리자 비밀번호 확인
cat ~/.jenkins/secrets/initialAdminPassword
```

### Linux (Ubuntu/Debian)
```bash
# Java 설치 (Jenkins 실행에 필요)
sudo apt update
sudo apt install openjdk-17-jdk -y

# Jenkins 저장소 키 추가
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Jenkins 저장소 추가
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Jenkins 설치
sudo apt update
sudo apt install jenkins -y

# Jenkins 서비스 시작
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Jenkins 상태 확인
sudo systemctl status jenkins

# 초기 관리자 비밀번호 확인
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### Windows
1. [Jenkins 다운로드 페이지](https://www.jenkins.io/download/)에서 Windows 설치 파일 다운로드
2. 다운로드한 `.msi` 파일 실행
3. 설치 마법사의 지시에 따라 설치 진행
   - 설치 경로 선택
   - 서비스 계정 설정
   - 포트 설정 (기본값: 8080)
4. 설치 완료 후 자동으로 Jenkins 서비스 시작
5. 웹 브라우저에서 `http://localhost:8080` 접속
6. 초기 관리자 비밀번호 입력 (Windows의 경우 `C:\Program Files\Jenkins\secrets\initialAdminPassword` 파일에서 확인)

### Jenkins 접속 방법
1. 웹 브라우저에서 `http://localhost:8080` 접속
2. 초기 관리자 비밀번호 입력 (위 명령어로 확인한 비밀번호)
3. 추천 플러그인 설치 또는 선택적 설치 진행
4. 관리자 계정 생성
5. Jenkins URL 설정 (기본값 유지 또는 변경)

### Jenkins 보안 설정
```bash
# Jenkins 사용자를 docker 그룹에 추가 (Docker 사용 시)
# Linux/macOS
sudo usermod -aG docker jenkins  # Linux
sudo dscl . -append /Groups/docker GroupMembership jenkins  # macOS

# Jenkins 서비스 재시작
# Linux
sudo systemctl restart jenkins
# macOS
brew services restart jenkins
# Windows
net stop jenkins
net start jenkins
```

### Jenkins 플러그인 설치
1. Jenkins 관리 > 플러그인 관리 메뉴 접속
2. 설치 가능 탭에서 필요한 플러그인 검색
3. 설치할 플러그인 선택 후 '지금 다운로드하고 재시작 후 설치' 클릭
4. Jenkins 재시작 후 플러그인 설치 완료

### 유용한 Jenkins 플러그인
- Git Integration
- GitHub Integration
- GitHub Branch Source Plugin 
- Pipeline
- Blue Ocean
- Environment Injector
- Maven Integration


## Java 빌드 및 테스트

```bash
# 빌드 및 테스트 실행
mvn clean package

# 테스트만 실행
mvn test
```

## 실행 방법

### 개발 환경
```bash
java -jar -Dspring.profiles.active=dev target/hello-world-0.0.1-SNAPSHOT.jar
```

### 운영 환경
```bash
java -jar -Dspring.profiles.active=prod target/hello-world-0.0.1-SNAPSHOT.jar
```

## API 엔드포인트

- `GET /`: Hello World 메시지 반환
- `GET /health`: 헬스 체크 엔드포인트

## 배포 방법

1. `deploy.sh` 스크립트에 실행 권한 부여:
```bash
chmod +x deploy.sh
```

2. 배포 스크립트 실행:
```bash
# 개발 환경 배포 (기본값)
./deploy.sh

# 운영 환경 배포
./deploy.sh prod
```

## 환경별 설정

### 개발 환경 (dev)
- 디버그 로깅 활성화
- 상세한 로그 출력
- 개발용 애플리케이션 이름 사용

### 운영 환경 (prod)
- INFO 레벨 로깅
- 최적화된 로그 출력
- 운영용 애플리케이션 이름 사용

### 테스트 환경 (test)
- 테스트용 포트 사용 (8081)
- 테스트 전용 로그 설정
- MockMvc를 사용한 통합 테스트 
