#CREATE DATABASE yeonsung_id DEFAULT CHARACTER SET UTF8;
USE yeonsung_id;

-- personal_info 테이블 생성
CREATE TABLE personal_info (
    id CHAR(12) UNIQUE,
    password CHAR(12) NOT NULL ,
    name CHAR(10) NOT NULL ,
    phone_number CHAR(13) NOT NULL ,
    email CHAR(32) NOT NULL ,
    student_id CHAR(10) NOT NULL ,
    PRIMARY KEY (id),
    CONSTRAINT chk_email CHECK (email LIKE '%@yeonsung.ac.kr'),
    CONSTRAINT chk_student_id CHECK (LENGTH(student_id) = 10 AND student_id REGEXP '^[0-9]+$')
);


INSERT INTO personal_info VALUES ('acaa', '1202', '홍길디', '01012345667', 'abaa@yeonsung.ac.kr', '202410004');

-- products 테이블에서 모든 정보 조회
SELECT * FROM personal_info;




