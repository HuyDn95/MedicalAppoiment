
DROP DATABASE IF EXISTS clinic_db;
CREATE DATABASE clinic_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE clinic_db;

CREATE TABLE patients (
                          id              BIGINT AUTO_INCREMENT PRIMARY KEY,
                          full_name       VARCHAR(100)  NOT NULL,
                          phone_number    VARCHAR(20)   UNIQUE,
                          email           VARCHAR(100)  UNIQUE,
                          date_of_birth   DATE,
                          gender          VARCHAR(10),
                          address         VARCHAR(255),
                          created_at      DATETIME      DEFAULT CURRENT_TIMESTAMP,
                          updated_at      DATETIME      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE doctors (
                         id              BIGINT AUTO_INCREMENT PRIMARY KEY,
                         full_name       VARCHAR(100)  NOT NULL,
                         specialization  VARCHAR(100),
                         phone_number    VARCHAR(20)   UNIQUE,
                         email           VARCHAR(100)  UNIQUE,
                         room_number     VARCHAR(20),
                         created_at      DATETIME      DEFAULT CURRENT_TIMESTAMP,
                         updated_at      DATETIME      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE appointments (
                              id                  BIGINT AUTO_INCREMENT PRIMARY KEY,
                              patient_id          BIGINT        NOT NULL,
                              doctor_id           BIGINT        NOT NULL,
                              appointment_time    DATETIME      NOT NULL,
                              status              ENUM('PENDING','CONFIRMED','CANCELLED','COMPLETED')
                                                                NOT NULL DEFAULT 'PENDING',
                              reason              VARCHAR(500),
                              created_at          DATETIME      DEFAULT CURRENT_TIMESTAMP,

                              CONSTRAINT fk_appointment_patient
                                  FOREIGN KEY (patient_id) REFERENCES patients(id)
                                      ON DELETE CASCADE ON UPDATE CASCADE,

                              CONSTRAINT fk_appointment_doctor
                                  FOREIGN KEY (doctor_id) REFERENCES doctors(id)
                                      ON DELETE CASCADE ON UPDATE CASCADE,

                              INDEX idx_appointment_doctor_time (doctor_id, appointment_time),
                              INDEX idx_appointment_patient (patient_id)
) ENGINE=InnoDB;

CREATE TABLE users (
                       id              BIGINT AUTO_INCREMENT PRIMARY KEY,
                       username        VARCHAR(50)   NOT NULL UNIQUE,
                       password        VARCHAR(255)  NOT NULL,
                       full_name       VARCHAR(100),
                       role            ENUM('ADMIN','DOCTOR','RECEPTIONIST') NOT NULL DEFAULT 'RECEPTIONIST',
                       enabled         BOOLEAN       DEFAULT TRUE,
                       created_at      DATETIME      DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================================================
-- Dữ liệu mẫu (Sample Data) để test nhanh
-- =========================================================
INSERT INTO doctors (full_name, specialization, phone_number, email, room_number) VALUES
                                                                                      ('BS. Nguyễn Văn An', 'Nội khoa', '0901234567', 'an.nguyen@clinic.vn', 'P101'),
                                                                                      ('BS. Trần Thị Bình', 'Nhi khoa', '0901234568', 'binh.tran@clinic.vn', 'P102'),
                                                                                      ('BS. Lê Văn Cường', 'Tim mạch', '0901234569', 'cuong.le@clinic.vn', 'P103');

INSERT INTO patients (full_name, phone_number, email, date_of_birth, gender, address) VALUES
                                                                                          ('Phạm Thị Dung', '0912345671', 'dung.pham@gmail.com', '1990-05-12', 'Nữ', 'Hà Nội'),
                                                                                          ('Hoàng Văn Em', '0912345672', 'em.hoang@gmail.com', '1985-11-23', 'Nam', 'Hải Phòng'),
                                                                                          ('Vũ Thị Phượng', '0912345673', 'phuong.vu@gmail.com', '1998-02-08', 'Nữ', 'Hà Nội');

INSERT INTO appointments (patient_id, doctor_id, appointment_time, status, reason) VALUES
                                                                                       (1, 1, '2026-07-10 08:30:00', 'PENDING',   'Khám tổng quát'),
                                                                                       (2, 2, '2026-07-10 09:00:00', 'CONFIRMED', 'Khám cho con nhỏ'),
                                                                                       (3, 3, '2026-07-11 10:00:00', 'PENDING',   'Kiểm tra tim mạch định kỳ');

INSERT INTO users (username, password, full_name, role) VALUES
    ('admin', '$2b$10$3q0f0NKc2K3fjwAyJRz6..jSVZRzzTPc3ft5c3NyfGZ6vSR3Pk9XG', 'Quản trị viên', 'ADMIN');