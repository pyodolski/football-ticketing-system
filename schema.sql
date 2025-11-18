-- 축구 티켓팅 시스템 데이터베이스 스키마

-- 1. 사용자 테이블
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. 경기 테이블
CREATE TABLE matches (
  id INT PRIMARY KEY AUTO_INCREMENT,
  home_team VARCHAR(50) NOT NULL,
  away_team VARCHAR(50) NOT NULL,
  match_date DATETIME NOT NULL,
  stadium VARCHAR(100) NOT NULL,
  total_seats INT NOT NULL DEFAULT 1000,
  available_seats INT NOT NULL DEFAULT 1000,
  price DECIMAL(10, 2) NOT NULL,
  status ENUM('upcoming', 'ongoing', 'finished', 'cancelled') DEFAULT 'upcoming',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. 예매 테이블
CREATE TABLE bookings (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  match_id INT NOT NULL,
  seat_number VARCHAR(10) NOT NULL,
  booking_status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
  total_price DECIMAL(10, 2) NOT NULL,
  booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (match_id) REFERENCES matches(id),
  UNIQUE KEY unique_seat (match_id, seat_number)
);

-- 인덱스 생성 (성능 최적화)
CREATE INDEX idx_match_date ON matches(match_date);
CREATE INDEX idx_user_bookings ON bookings(user_id);
CREATE INDEX idx_match_bookings ON bookings(match_id);
