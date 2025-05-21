# Hello World 애플리케이션

이 프로젝트는 배포 실습을 위한 간단한 Spring Boot 애플리케이션입니다.

## 요구사항

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
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update

# JDK 17 설치
sudo apt install openjdk-17-jdk

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
```

### Linux (Ubuntu/Debian)
```bash
# apt를 사용한 설치
sudo apt update
sudo apt install maven

# 설치 확인
mvn -version
```

### Windows
1. [Maven 공식 웹사이트](https://maven.apache.org/download.cgi)에서 최신 버전 다운로드
2. 다운로드한 파일을 원하는 디렉토리에 압축 해제
3. 환경 변수 설정:
   - `MAVEN_HOME`: Maven 설치 디렉토리
   - `PATH`: `%MAVEN_HOME%\bin` 추가

## 유용한 링크

- [Maven 공식 문서](https://maven.apache.org/guides/)
- [Spring Boot 가이드](https://spring.io/guides)
- [Maven Central Repository](https://search.maven.org/)
- [Spring Boot 프로필 설정 가이드](https://docs.spring.io/spring-boot/docs/current/reference/html/features.html#features.profiles)

## 빌드 및 테스트

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
