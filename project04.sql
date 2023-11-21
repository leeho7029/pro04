CREATE DATABASE project4;
USE project4;

-- 회원
CREATE TABLE user(
  id VARCHAR(20) PRIMARY KEY NOT NULL,
  pw VARCHAR(300) NOT NULL,
  NAME VARCHAR(50),
  email VARCHAR(100) NOT NULL,
  tel VARCHAR(20) NOT NULL,
  addr1 VARCHAR(200),
  addr2 VARCHAR(100),
  postcode VARCHAR(10),
  regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  birth DATE,
  pt INT(11) DEFAULT 0,
  visited INT(11) DEFAULT 0,
  isStudy BOOLEAN DEFAULT false);
  
SELECT * FROM user;
UPDATE user SET pw='$2a$10$KXY.EhEskta7wG/HvMSeZ.CQ4FuGQZOmaHTL2eZPnidD6AUvc.rUS'
WHERE id='admin';

-- 커뮤니티 카테고리 테이블 생성
CREATE TABLE category(
   cate VARCHAR(5) PRIMARY KEY NOT NULL,
   cateName VARCHAR(100) NOT NULL);


-- 카테고리 테이블 데이터
INSERT INTO category VALUES('A', '자유게시판');
INSERT INTO category VALUES('B', '교육정보');
INSERT INTO category VALUES('C', '강의 추천');
INSERT INTO category VALUES('D', '진로상담');


-- 게시판 테이블 생성
CREATE TABLE board(
  seq INT PRIMARY KEY AUTO_INCREMENT,
  cate VARCHAR(5) NOT NULL,
  title VARCHAR(200) NOT NULL,
  content VARCHAR(1000),
  nickname VARCHAR(20),
  regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  visited INT DEFAULT 0,
  FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE,
  FOREIGN KEY(nickname) REFERENCES user(id) ON DELETE CASCADE);


-- 커뮤니티 댓글 테이블 생성
CREATE TABLE COMMENT(
   comNo INT PRIMARY KEY AUTO_INCREMENT,
   seq INT NOT NULL,
   nickname VARCHAR(20) NOT NULL,
   resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   content VARCHAR(1000) NOT NULL,
   FOREIGN KEY(seq) REFERENCES board(seq) ON DELETE CASCADE,
   FOREIGN KEY(nickname) REFERENCES user(id) ON DELETE CASCADE
);


-- 공지사항 테이블 생성
CREATE TABLE notice (
   seq INT AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(100) NOT NULL,
   content VARCHAR(1000) NOT NULL,
   nickname VARCHAR(20),
   regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   visited INT DEFAULT 0
);


INSERT INTO user
VALUES('admin','$2a$10$piyWPHz4GuwW0GxHZZfy1ORWtzKu7KPr9M0mFpw90hQJRQditQqJO','관리자','admin@tspoon.com','010-1234-5678',NULL, NULL, NULL,'2023-07-01', '1990-01-01', DEFAULT, DEFAULT);
-- faq 테이블 생성
CREATE TABLE faq (
   fno INT  PRIMARY KEY AUTO_INCREMENT ,
   question VARCHAR(1000) NOT NULL,
   answer VARCHAR(1000) NOT NULL,
   cnt INT DEFAULT 0 NOT NULL
);

-- faq 더미 데이터 추가
INSERT INTO faq(question, answer) VALUES('웹사이트에 어떻게 가입하나요?', '회원 가입 페이지에서 필요한 정보를 입력하여 가입할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('게시물을 어떻게 작성하나요?', '커뮤니티 페이지의 "글 작성" 버튼을 클릭하여 게시물을 작성할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('다른 회원들의 게시물에 댓글을 달고 싶어요. 어떻게 해야 하나요?','게시물의 하단에 있는 "댓글 작성" 영역에 댓글을 입력하여 등록할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('제가 작성한 글이 갑자기 사라졌어요', '부적절한 내용은 관리자가 예고 없이 삭제할 수 있습니다. 커뮤니티 규칙을 지켜주세요:)');
INSERT INTO faq(question, answer) VALUES('개인 정보 보호 정책은 무엇인가요?', '웹사이트의 개인 정보 보호 정책은 "회원가입의 회원약관동의" 페이지에서 확인할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('문의사항이 있을 때 어떻게 연락할 수 있나요?', '고객지원의 "QnA" 페이지에서 문의글을 작성하여 문의할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('어떤 유형의 교육자료를 제공하나요?', '초등학교, 중학교 및 고등학교 학생들을 위한 교과서, 참고서 및 워크북을 포함한 다양한 교육자료를 제공합니다.');
INSERT INTO faq(question, answer) VALUES('책은 실물 및 디지털 형식으로 모두 제공되나요?', '네, 대부분의 책은 실물 및 디지털 형식으로 제공되며 다양한 학습 선호도를 고려합니다.');
INSERT INTO faq(question, answer) VALUES('책이나 주제에 대한 제안을 할 수 있나요?', '물론입니다! 저희는 모든 제안을 소중히 생각합니다. 고객 지원팀에 의견을 보내주시면 됩니다.');
INSERT INTO faq(question, answer) VALUES('책은 정기적으로 업데이트되나요?', '네, 정확성과 관련성을 보장하기 위해 최신 교과서 및 참고 자료의 최신 판을 제공하기 위해 노력하고 있습니다.');


-- QNA
CREATE TABLE qna(
  qno int PRIMARY KEY AUTO_INCREMENT,   			-- 번호
  title VARCHAR(100) NOT NULL,   					-- 제목
  content VARCHAR(1000) NOT NULL,   				-- 내용`
  author VARCHAR(16),   								-- 작성자
  resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 등록일
  lev INT DEFAULT 0, 									-- 질문(0), 답변(1)
  par INT DEFAULT 0,													-- 질문(자신 레코드의 qno), 답변(질문의 글번호)
  FOREIGN KEY(author) REFERENCES user(id) ON DELETE CASCADE);


-- 자료실 테이블 생성
CREATE TABLE dataRoom (
  articleNo int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id VARCHAR(20) NOT NULL,
  title varchar(100) NOT NULL,
  content varchar(2000) NOT NULL,
  regdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- 업로드 된 파일 정보 테이블 생성
CREATE TABLE fileInfo(
  no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  articleNo INT,
  saveFolder VARCHAR(300) NOT NULL,
  originFile VARCHAR(300) NOT NULL,
  saveFile VARCHAR(300) NOT NULL,
  FOREIGN KEY(articleNo) REFERENCES dataRoom(articleNo) ON DELETE CASCADE 
);


	
-- 과목 테이블 (과목코드, 과목명)
CREATE TABLE subject(
	scode VARCHAR(10) PRIMARY KEY,
	sname VARCHAR(200) NOT NULL
);


-- 과목 테이블 더미데이터
INSERT INTO SUBJECT
VALUES('ko', '국어');
INSERT INTO SUBJECT
VALUES('ma', '수학');
INSERT INTO SUBJECT
VALUES('en', '영어');
INSERT INTO SUBJECT
VALUES('so', '사회');
INSERT INTO SUBJECT
VALUES('sc', '과학');


-- 강사 테이블 (강사코드, 강사명, 연락처, 이메일, 강사소개, 강사 이미지)
CREATE TABLE teacher(
	tcode INT PRIMARY KEY AUTO_INCREMENT,
	tname VARCHAR(50) NOT NULL,
	ttel VARCHAR(20) NOT NULL,
	temail VARCHAR(100) NOT NULL,
	tcontent VARCHAR(1000) NOT NULL,
	saveFile VARCHAR(300) NOT NULL
);


-- 강의 테이블 (강의코드, 강의명, 과목코드, 강사코드, 강의 소개, 강의 단가, 수강인원, 강의 썸네일(saveFile), 강의 시작일, 강의 종료일, (오프라인 시)강의 시작시간, 온오프 여부, 강의실)
CREATE TABLE lecture(
	lcode VARCHAR(50) PRIMARY KEY,
	lname VARCHAR(500) NOT NULL,
	scode VARCHAR(10) NOT NULL,
	tcode INT,
	bcode varcar(10) NOT NULL,
	lcontent VARCHAR(1000) NOT NULL,
	lprice INT DEFAULT 0,
	maxStudent INT DEFAULT 0,
	saveFile VARCHAR(300) NOT NULL,
	sdate DATE NOT NULL,
	edate DATE NOT NULL,
	stime TIME,
	state VARCHAR(10) CHECK(state IN ('on', 'off', 'close')),
	classroom VARCHAR(10),
	FOREIGN KEY(scode) REFERENCES SUBJECT(scode),
	FOREIGN KEY(tcode) REFERENCES teacher(tcode)
	FOREIGN KEY(bcode) REFERENCES book(bcode)
);

SELECT * FROM lecture;
WHERE sdate < (CURRENT_DATE) or


-- 커리큘럼 (커리큘럼코드, 강의코드, 강좌 제목, 강의 파일, 강의 시간)
CREATE TABLE curriculum(
	ccode INT PRIMARY KEY AUTO_INCREMENT,
	lcode VARCHAR(50) NOT NULL,
	cname VARCHAR(500) NOT NULL,
	cvideo VARCHAR(500)
	FOREIGN KEY(lcode) REFERENCES lecture(lcode) ON DELETE CASCADE
);

-- 강의 리뷰(리뷰코드, 강의코드, 학생아이디, 별점, 리뷰 내용)
CREATE TABLE review(
	rcode INT AUTO_INCREMENT PRIMARY KEY,
	lcode VARCHAR(50) NOT NULL,
	id VARCHAR(20) NOT NULL,
	star INT NOT NULL DEFAULT 0,
	content VARCHAR(1000) NOT NULL,
	FOREIGN KEY (lcode) REFERENCES lecture(lcode) ON DELETE CASCADE
);

-- 수강(수강코드, 강의코드, 학생아이디, 수강총시간, 수강 완료여부)
CREATE TABLE register(
	rcode INT AUTO_INCREMENT PRIMARY KEY,
	lcode VARCHAR(50) NOT NULL,
	id VARCHAR(20) NOT NULL,
	completed BOOLEAN DEFAULT FALSE,
	FOREIGN KEY(id) REFERENCES user(id) ON DELETE CASCADE
);

create table payment(
	   pno INT primary KEY AUTO_INCREMENT,
	   title VARCHAR(100) NOT NULL,
		lcode VARCHAR(50) NOT NULL,		
		bcode VARCHAR(20) NOT NULL,
		tcode INT,
	   id varchar(20) not null,	
	   method varchar(100),		
	   com varchar(100),			
	   price int default 1000,
		dno INT,	
	   account varchar(100) NOT NULL,
	   resdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	   FOREIGN KEY (lcode) REFERENCES lecture (lcode) ON DELETE CASCADE,
	   FOREIGN KEY (bcode) REFERENCES book (bcode) ON DELETE CASCADE,
	   FOREIGN KEY (tcode) REFERENCES teacher (tcode) ON DELETE CASCADE,
	   FOREIGN KEY (dno) REFERENCES delivery(dno) ON DELETE CASCADE,
		FOREIGN KEY (id) REFERENCES user (id) ON DELETE CASCADE
);
-- 수강생 강의 수강 정보 테이블
CREATE TABLE studyInfo(
	scode INT AUTO_INCREMENT PRIMARY KEY,
	ccode INT NOT NULL,
	id VARCHAR(20) NOT NULL,
	studyTime DOUBLE DEFAULT 0,
	completed BOOLEAN DEFAULT FALSE,
	FOREIGN KEY(id) REFERENCES user(id) ON DELETE CASCADE,
	FOREIGN KEY(ccode) REFERENCES curriculum(ccode) ON DELETE CASCADE
);

create table delivery(
	 dno int primary KEY AUTO_INCREMENT,
	 pno int, 					
	 id varchar(20),				
	 addr VARCHAR(200),	
	 tel varchar(13) not null,				
	 dcom varchar(100),					
	 dtel varchar(13),			
	 dstatus int default 0,				
	 ddate timestamp default CURRENT_TIMESTAMP,
	 edate varchar(13),						
	 dcode varchar(30),
	 FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE				
);

create table serve(
    sno int primary KEY AUTO_INCREMENT,							
    bcode VARCHAR(20) NOT NULL,		              
    sprice int default 1000,					 
    amount int default 1,				         	
    resdate timestamp default CURRENT_TIMESTAMP,
	 FOREIGN KEY (bcode) REFERENCES book (bcode) ON DELETE CASCADE    
);


-- lecTable
CREATE TABLE lecboard(
  qno int PRIMARY KEY AUTO_INCREMENT,   			-- 번호
  lcode VARCHAR(50) NOT NULL,
  title VARCHAR(100) NOT NULL,   					-- 제목
  content VARCHAR(1000) NOT NULL,   				-- 내용
  author VARCHAR(16),   								-- 작성자
  resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 등록일
  lev INT DEFAULT 0, 									-- 질문(0), 답변(1)
  par INT DEFAULT 0,													-- 질문(자신 레코드의 qno), 답변(질문의 글번호)
  FOREIGN KEY(author) REFERENCES user(id) ON DELETE CASCADE,
  FOREIGN KEY(lcode) REFERENCES lecture(lcode) ON DELETE CASCADE);

 insert into lecBoard values (default, #{title}, #{content}, #{author}, default, 0, default, #{lcode})


-- 핵심 기능: 공지사항, 자료실, 회원, 자유게시판, 강의별 댓글,  교재와 시범강의, 결제
-- 부가 기능: 파일업로드, 채팅, 타계정 또는 SNS 로그인, 수강평, 달력, 가입 시 축하 이메일 보내기, 비밀번호 변경 시 이메일 보내기, 온라인 평가, 진도관리, 학습 스케줄러, 나의 강의실 등team33