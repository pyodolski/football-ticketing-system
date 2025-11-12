# 대규모 트래픽 처리 - 티켓팅 시스템

선착순 티켓 예매 시나리오를 통한 대규모 동시 접속 처리 프로젝트

## 프로젝트 목표

- 동시 다발적인 티켓 예매 요청 처리
- 재고 정합성 보장 (동시성 제어)
- 높은 TPS(Transaction Per Second) 달성
- 시스템 병목 지점 분석 및 최적화

## 기술 스택

- **Language**: Java 17
- **Framework**: Spring Boot 3.2
- **Database**: MySQL, H2 (개발용)
- **Cache**: Redis
- **Build Tool**: Maven

## 핵심 구현 사항

1. **동시성 제어**
   - Redis 분산 락
   - Optimistic Lock / Pessimistic Lock
2. **성능 최적화**
   - Redis 캐싱
   - 커넥션 풀 튜닝
   - 데이터베이스 인덱싱
3. **부하 테스트**
   - JMeter를 통한 성능 측정
   - 병목 지점 분석

## 시작하기

### 사전 요구사항

- JDK 17 이상
- Maven 3.6 이상
- Redis (선택사항, 없으면 H2만으로 시작 가능)

### 실행 방법

```bash
# 의존성 설치
mvn clean install

# 애플리케이션 실행
mvn spring-boot:run
```

### H2 Console 접속

- URL: http://localhost:8080/h2-console
- JDBC URL: jdbc:h2:mem:ticketing
- Username: sa
- Password: (비워두기)

## 프로젝트 구조

```
src/main/java/com/ticketing/
├── controller/          # REST API 엔드포인트
├── service/             # 비즈니스 로직
├── repository/          # 데이터 접근 계층
├── domain/              # 엔티티 클래스
├── dto/                 # 요청/응답 DTO
├── config/              # 설정 클래스
└── exception/           # 예외 처리
```

## 다음 단계

1. 도메인 모델 설계 (Event, Ticket, Reservation)
2. Repository 계층 구현
3. Service 계층 구현 (동시성 제어 포함)
4. Controller 계층 구현
5. 부하 테스트 및 최적화

## 학습 포인트

- 대규모 트래픽 환경에서의 동시성 제어
- 분산 시스템에서의 데이터 정합성
- 성능 측정 및 병목 지점 분석
- 캐싱 전략 및 최적화 기법
