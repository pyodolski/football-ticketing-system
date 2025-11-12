-- 이벤트 테이블
CREATE TABLE IF NOT EXISTS event (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    event_date DATETIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    total_tickets INT NOT NULL,
    available_tickets INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_event_date (event_date)
);

-- 티켓 테이블
CREATE TABLE IF NOT EXISTS ticket (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    event_id BIGINT NOT NULL,
    seat_number VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'AVAILABLE',
    version BIGINT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (event_id) REFERENCES event(id),
    INDEX idx_ticket_event_id (event_id),
    INDEX idx_ticket_status (status)
);

-- 예약 테이블
CREATE TABLE IF NOT EXISTS reservation (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    ticket_id BIGINT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    reserved_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    expires_at DATETIME NOT NULL,
    confirmed_at DATETIME,
    cancelled_at DATETIME,
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    INDEX idx_reservation_user_id (user_id),
    INDEX idx_reservation_status (status),
    INDEX idx_reservation_expires_at (expires_at)
);

-- 초기 데이터 삽입 (테스트용)
INSERT INTO event (name, event_date, location, total_tickets, available_tickets) 
VALUES ('BTS 콘서트', '2025-12-31 19:00:00', '잠실 올림픽 주경기장', 1000, 1000);

-- 티켓 생성 (1000개)
-- 실제로는 애플리케이션 코드에서 생성하는 것을 추천
