# Hello World 애플리케이션

이 프로젝트는 배포 실습을 위한 간단한 Spring Boot 애플리케이션입니다.

## 요구사항

- Java 17
- Maven 3.6+

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