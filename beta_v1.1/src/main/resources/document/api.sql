SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Reply;
DROP TABLE IF EXISTS Festival;
DROP TABLE IF EXISTS Image;
DROP TABLE IF EXISTS ImgList;
DROP TABLE IF EXISTS raw;
DROP TABLE IF EXISTS User;




/* Create Tables */

-- 권한
CREATE TABLE authorities
(
	idx int unsigned NOT NULL AUTO_INCREMENT COMMENT '권한번호',
	ROLE varchar(45) COMMENT '권한내용',
	uIdx int unsigned NOT NULL COMMENT '유저번호',
	PRIMARY KEY (idx)
) COMMENT = '권한';


-- 행사정보
CREATE TABLE Event
(
	idx int unsigned NOT NULL AUTO_INCREMENT COMMENT '행사번호',
	eDate date NOT NULL COMMENT '일자',
	eTime time NOT NULL COMMENT '일시',
	eTerm time NOT NULL COMMENT '행사시간',
	eTitle text NOT NULL COMMENT '명칭',
	eNote text COMMENT '행사내용',
	ePlace text COMMENT '장소',
	eSeats int unsigned NOT NULL COMMENT '인원',
	etc text COMMENT '세부정보',
	fIdx int unsigned NOT NULL COMMENT '원본번호',
	aIdx int unsigned COMMENT '이미지목록번호',
	PRIMARY KEY (idx)
) COMMENT = '행사정보';


-- 축제정보
CREATE TABLE Festival
(
	idx int unsigned NOT NULL AUTO_INCREMENT COMMENT '축제번호',
	wDate datetime DEFAULT now() NOT NULL COMMENT '저장일시',
	status varchar(2) DEFAULT 'N' NOT NULL COMMENT '노출설정',
	title text COMMENT '표시제목',
	note text COMMENT '표시내용',
	addr text COMMENT '주소',
	startDate date COMMENT '시작일',
	endDate date COMMENT '종료일',
	fTel varchar(13) COMMENT '연락처',
	location text COMMENT '지도좌표',
	rIdx int unsigned NOT NULL COMMENT '원본번호',
	aIdx int unsigned COMMENT '이미지그룹번호',
	PRIMARY KEY (idx)
) COMMENT = '축제정보';


-- 사진
CREATE TABLE Image
(
	idx int unsigned NOT NULL AUTO_INCREMENT COMMENT '사진번호',
	fileName text NOT NULL COMMENT '물리파일명',
	oriName text NOT NULL COMMENT '논리파일명',
	aIdx int unsigned NOT NULL COMMENT '이미지그룹번호',
	PRIMARY KEY (idx)
) COMMENT = '사진';


-- 이미지그룹
CREATE TABLE ImgList
(
	idx int unsigned NOT NULL AUTO_INCREMENT COMMENT '그룹번호',
	PRIMARY KEY (idx)
) COMMENT = '이미지그룹';


-- 공공데이터
CREATE TABLE raw
(
	idx int unsigned NOT NULL AUTO_INCREMENT COMMENT '원본번호',
	wDate datetime DEFAULT now() NOT NULL COMMENT '저장일시',
	status varchar(2) DEFAULT 'N' NOT NULL COMMENT '등록상태',
	title text COMMENT '명칭',
	alternativeTitle text COMMENT '대체명칭',
	creator text COMMENT '주책임자',
	regDate text COMMENT '등록일',
	collectionDb text COMMENT '소속DB',
	subjectCategory text COMMENT '기관별주제분류체계',
	subjectKeyword text COMMENT '핵심주제어',
	extent text COMMENT '자원크기',
	description text COMMENT '내용',
	spatialCoverage text COMMENT '관련장소',
	temporalCoverage text COMMENT '해당시간대',
	person text COMMENT '사람',
	language text COMMENT '언어',
	sourceTitle text COMMENT '참조자원제목',
	referenceIdentifier text COMMENT '참조식별정보',
	rights text COMMENT '자원권리',
	copyrightOthers text COMMENT '저작권',
	url text COMMENT '지시정보자원위치정보',
	contributor text COMMENT '기여자',
	PRIMARY KEY (idx)
) COMMENT = '공공데이터';


-- 축제리뷰
CREATE TABLE Reply
(
	idx int unsigned NOT NULL AUTO_INCREMENT COMMENT '원본번호',
	note text COMMENT '내용',
	wDate datetime DEFAULT now() NOT NULL COMMENT '작성시간',
	fIdx int unsigned NOT NULL COMMENT '축제번호',
	uIdx int unsigned NOT NULL COMMENT '리뷰작성유저번호',
	PRIMARY KEY (idx)
) COMMENT = '축제리뷰';


-- 예약정보
CREATE TABLE Reservation
(
	idx int unsigned NOT NULL AUTO_INCREMENT COMMENT '예약번호',
	wDate datetime DEFAULT now() NOT NULL COMMENT '예약일자',
	person int unsigned NOT NULL COMMENT '예약인원',
	stat varchar(2) DEFAULT 'A' NOT NULL COMMENT '처리상태',
	eIdx int unsigned NOT NULL COMMENT '행사번호',
	uIdx int unsigned NOT NULL COMMENT '예약유저번호',
	PRIMARY KEY (idx)
) COMMENT = '예약정보';


-- 유저정보
CREATE TABLE User
(
	idx int unsigned NOT NULL AUTO_INCREMENT COMMENT '유저번호',
	ID text COMMENT '아이디',
	PASSWORD text COMMENT '비번',
	NAME text COMMENT '이름',
	birth date COMMENT '생년월일',
	tel varchar(13) COMMENT '전화번호',
	EMAIL text COMMENT '이메일',
	uStat varchar(2) DEFAULT 'A' NOT NULL COMMENT '계정상태',
	jDate datetime DEFAULT now() NOT NULL COMMENT '가입일자',
	PRIMARY KEY (idx)
) COMMENT = '유저정보';



/* Create Foreign Keys */

ALTER TABLE Reservation
	ADD FOREIGN KEY (eIdx)
	REFERENCES Event (idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Reply
	ADD FOREIGN KEY (fIdx)
	REFERENCES Festival (idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Event
	ADD FOREIGN KEY (aIdx)
	REFERENCES ImgList (idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Festival
	ADD FOREIGN KEY (aIdx)
	REFERENCES ImgList (idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Image
	ADD FOREIGN KEY (aIdx)
	REFERENCES ImgList (idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Event
	ADD FOREIGN KEY (fIdx)
	REFERENCES raw (idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Festival
	ADD FOREIGN KEY (rIdx)
	REFERENCES raw (idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE authorities
	ADD FOREIGN KEY (uIdx)
	REFERENCES User (idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Reply
	ADD FOREIGN KEY (uIdx)
	REFERENCES User (idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Reservation
	ADD FOREIGN KEY (uIdx)
	REFERENCES User (idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



