# 개발 환경 설정 가이드

## 1. JDK 설치 확인

```bash
java -version
```

Java 17 이상이 필요합니다. 없다면 설치하세요.

## 2. Maven 설치 확인

```bash
mvn -version
```

## 3. Redis 설치 (선택사항)

### macOS

```bash
brew install redis
brew services start redis
```

### 확인

```bash
redis-cli ping
# 응답: PONG
```

Redis 없이도 H2 데이터베이스로 시작할 수 있습니다.
분산 락 기능을 사용하려면 Redis가 필요합니다.

## 4. 프로젝트 빌드

```bash
# 의존성 다운로드 및 빌드
mvn clean install
```

## 5. 애플리케이션 실행

```bash
mvn spring-boot:run
```

서버가 시작되면 http://localhost:8080 에서 접근 가능합니다.

## 6. H2 Console 접속 (개발용 DB)

- URL: http://localhost:8080/h2-console
- JDBC URL: `jdbc:h2:mem:ticketing`
- Username: `sa`
- Password: (비워두기)

## 7. API 테스트

### Postman 또는 curl 사용

```bash
# 이벤트 조회 예시 (구현 후)
curl http://localhost:8080/api/events/1
```

## 8. MySQL 사용 (선택사항)

H2 대신 MySQL을 사용하려면:

1. MySQL 설치 및 실행
2. 데이터베이스 생성

```sql
CREATE DATABASE ticketing CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

3. application.yml 수정

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/ticketing?useSSL=false&serverTimezone=Asia/Seoul
    driver-class-name: com.mysql.cj.jdbc.Driver
    username: root
    password: your_password
```

## 9. IDE 설정

### IntelliJ IDEA

1. File > Open > pom.xml 선택
2. "Open as Project" 선택
3. Maven 의존성 자동 다운로드 대기
4. Lombok 플러그인 설치 (Settings > Plugins)
5. Annotation Processing 활성화 (Settings > Build > Compiler > Annotation Processors)

### VS Code

1. Extension Pack for Java 설치
2. Spring Boot Extension Pack 설치
3. 프로젝트 폴더 열기

## 10. 다음 단계

이제 IMPLEMENTATION_GUIDE.md를 참고하여 코드를 작성하세요!

첫 번째 작업: `src/main/java/com/ticketing/domain/Event.java` 엔티티 생성
