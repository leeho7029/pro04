CREATE DATABASE haebeop;

USE haebeop;

CREATE TABLE test(num INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL);

INSERT INTO test VALUES (DEFAULT, '테스트제목1');
INSERT INTO test VALUES (DEFAULT, '테스트제목2');
INSERT INTO test VALUES (DEFAULT, '테스트제목3');
INSERT INTO test VALUES (DEFAULT, '테스트제목4');
INSERT INTO test VALUES (DEFAULT, '테스트제목5');

SELECT * from test;

COMMIT;

SELECT * FROM emp;

DESC test;

DESC emp;

CREATE TABLE user(
    id VARCHAR(20) PRIMARY KEY unique, pw VARCHAR(350) NOT NULL,
    name VARCHAR(50) NOT NULL, email VARCHAR(150),
    tel VARCHAR(50), addr1 VARCHAR(200),
    addr2 VARCHAR(200), postcode VARCHAR(20),
    regdate DATETIME DEFAULT CURRENT_TIME,
	 birth DATE DEFAULT CURRENT_DATE,
    pt INT DEFAULT 0,
    visited INT DEFAULT 0
);

INSERT INTO user
VALUES('admin','$2a$10$piyWPHz4GuwW0GxHZZfy1ORWtzKu7KPr9M0mFpw90hQJRQditQqJO','관리자','admin@tspoon.com','010-1234-5678',NULL, NULL, NULL,'2023-07-01', '1990-01-01', DEFAULT, DEFAULT);
CREATE TABLE notice (
   seq INT AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(100) NOT NULL,
   content VARCHAR(1000) NOT NULL,
   id VARCHAR(20),
   regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   visited INT DEFAULT 0
);




CREATE TABLE subject (
    subno INT AUTO_INCREMENT PRIMARY KEY,
    subcode VARCHAR(36) NOT NULL unique,
    title VARCHAR(20) NOT NULL
);


CREATE TABLE book (
    bkno INT AUTO_INCREMENT primary key ,
    bkcode VARCHAR(36) NOT NULL UNIQUE,
    bktitle VARCHAR(20) NOT NULL,
    bindex VARCHAR(100) NOT NULL,
    regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    pubdate VARCHAR(100) NOT NULL,
    author VARCHAR(16) NOT NULL,
    price INT NOT NULL,
    memo VARCHAR(500)
);




CREATE TABLE fileinfo4(
	no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	bkno VARCHAR(36),
	saveFolder VARCHAR(300) NOT NULL,
	originFile VARCHAR(300) NOT NULL,
	saveFile VARCHAR(300) NOT NULL
	);


CREATE TABLE lecture (
    lecno INT AUTO_INCREMENT PRIMARY KEY,
    leccode VARCHAR(36) NOT NULL unique,
    cate VARCHAR(20) NOT NULL,
    lectitle VARCHAR(20) NOT NULL,
    stno INT NOT NULL,
    price INT DEFAULT 0
);

CREATE TABLE register (
	 regno INT AUTO_INCREMENT PRIMARY KEY,
    regcode VARCHAR(36) NOT NULL,
    leccode VARCHAR(36) NOT NULL,
    id VARCHAR(20),
    FOREIGN KEY (leccode) REFERENCES lecture(leccode) ON DELETE CASCADE
);

CREATE TABLE fileinfo3(
	no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	lecno INT,
	saveFolder VARCHAR(300) NOT NULL,
	originFile VARCHAR(300) NOT NULL,
	saveFile VARCHAR(300) NOT NULL
);


CREATE TABLE fileinfo2(
	no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	leccode INT,
	saveFolder VARCHAR(300) NOT NULL,
	originFile VARCHAR(300) NOT NULL,
	saveFile VARCHAR(300) NOT NULL);





CREATE TABLE teacher (
    seq SERIAL PRIMARY KEY unique,
    tname VARCHAR(20) NOT NULL,
    ttel VARCHAR(20) NOT NULL,
    tmail VARCHAR(20) NOT NULL,
    regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE fileinfo2(
	no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	seq INT,
	saveFolder VARCHAR(300) NOT NULL,
	originFile VARCHAR(300) NOT NULL,
	saveFile VARCHAR(300) NOT NULL);
  
  select * from fileInfo2

CREATE TABLE lecBoardKor (
   seq INT AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(100) NOT NULL,
   content VARCHAR(1000) NOT NULL,
   id VARCHAR(20),
   regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   visited INT DEFAULT 0
);

INSERT INTO lecBoardKor  VALUES (DEFAULT,'샘플 글 제목1  입니다.','여기는 샘플 글 1의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO lecBoardKor  VALUES (DEFAULT,'샘플 글 제목2  입니다.','여기는 샘플 글 2의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO lecBoardKor  VALUES (DEFAULT,'샘플 글 제목3  입니다.','여기는 샘플 글 3의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO lecBoardKor VALUES (DEFAULT,'샘플 글 제목4  입니다.','여기는 샘플 글 4의 내용입니다.','admin',DEFAULT, DEFAULT);

CREATE TABLE lecBoardEng (
   seq INT AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(100) NOT NULL,
   content VARCHAR(1000) NOT NULL,
   id VARCHAR(20),
   regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   visited INT DEFAULT 0
);

CREATE TABLE lecBoardMath (
   seq INT AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(100) NOT NULL,
   content VARCHAR(1000) NOT NULL,
   id VARCHAR(20),
   regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   visited INT DEFAULT 0
);


INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목1  입니다.','여기는 샘플 글 1의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목2  입니다.','여기는 샘플 글 2의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목3  입니다.','여기는 샘플 글 3의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목4  입니다.','여기는 샘플 글 4의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목5  입니다.','여기는 샘플 글 5의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목6  입니다.','여기는 샘플 글 6의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목7  입니다.','여기는 샘플 글 1의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목8  입니다.','여기는 샘플 글 2의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목9  입니다.','여기는 샘플 글 3의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목10  입니다.','여기는 샘플 글 4의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목11  입니다.','여기는 샘플 글 1의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목12  입니다.','여기는 샘플 글 2의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목13  입니다.','여기는 샘플 글 3의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목14  입니다.','여기는 샘플 글 4의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목15  입니다.','여기는 샘플 글 5의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목16  입니다.','여기는 샘플 글 6의 내용입니다.','admin',DEFAULT, DEFAULT);


SELECT * FROM test


-- 자료실 자료 데이터 테이블 생성
CREATE TABLE fileinfo(
	no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	articleno INT,
	saveFolder VARCHAR(300) NOT NULL,
	originFile VARCHAR(300) NOT NULL,
	saveFile VARCHAR(300) NOT NULL);
                         
-- 자료실 테이블 생성
CREATE TABLE fileboard (
   articleno int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   id varchar(16) NOT NULL,
   title varchar(100) NOT NULL,
   content varchar(2000) NOT NULL,
   regdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE COMMENT(
   comNo INT PRIMARY KEY AUTO_INCREMENT,
   cno INT NOT NULL,
   author VARCHAR(20) NOT NULL,
   resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   content VARCHAR(1000) NOT NULL,
   FOREIGN KEY(cno) REFERENCES community(cno) ON DELETE CASCADE,
   FOREIGN KEY(author) REFERENCES user(id) ON DELETE CASCADE
);

CREATE TABLE community(
  cno INT PRIMARY KEY AUTO_INCREMENT,
  cate VARCHAR(5) NOT NULL,
  title VARCHAR(200) NOT NULL,
  content VARCHAR(1000),
  author VARCHAR(20),
  resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  cnt INT DEFAULT 0,
  FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE,
  FOREIGN KEY(author) REFERENCES user(id) ON DELETE CASCADE);
  
  
  CREATE TABLE category(
   cate VARCHAR(5) PRIMARY KEY NOT NULL,
   cateName VARCHAR(100) NOT NULL);

-- 카테고리 테이블 데이터
INSERT INTO category VALUES('A', '자유게시판');
INSERT INTO category VALUES('B', '교육정보');
INSERT INTO category VALUES('C', '교재/학원 추천');
INSERT INTO category VALUES('D', '진로상담');
SELECT * FROM register WHERE id IN ('admin', 'wkdghdidi');
     select * from register where id='admin',id='wkdghdidi'