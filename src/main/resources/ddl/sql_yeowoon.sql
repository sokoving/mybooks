drop SEQUENCE seq_tbl_book;
drop table prj_book;
drop TABLE prj_platform;
drop TABLE prj_bookmark;
drop TABLE prj_bookmemo;



CREATE SEQUENCE seq_prj_book;
CREATE TABLE prj_book (
user_id VARCHAR2(20) --userID
, importance NUMBER(3) DEFAULT 0 --중요도
, book_no VARCHAR2(100) --글번호
, platform_id NUMBER(2)--플랫폼 아이디
, book_title VARCHAR2(100) NOT NULL --제목
, writer VARCHAR2(100) NOT NULL --작가
, star_rate NUMBER(1)  --별점
, book_comment VARCHAR2(100) --한줄평
, cur_page NUMBER(5) DEFAULT 0 --현재 회차
, total_page NUMBER(5) DEFAULT 0 --총 회차
, the_end CHAR(2) DEFAULT 'F' --완결 여부
, reg_date DATE DEFAULT SYSDATE    -- 등록 날짜
, CONSTRAINT pk_book_no PRIMARY KEY (book_no)
);

SELECT
user_id, importance
, book_no, a. platform_id, b.platform_name
, book_title, writer, star_rate, book_comment
, cur_page, total_page, the_end, reg_date
FROM prj_book A
LEFT OUTER JOIN prj_platform B
on a.platform_id = b.platform_id
;

        SELECT COUNT(*)
        FROM prj_book;

INSERT INTO prj_book
(book_no, platform_id, book_title, writer, star_rate, book_comment)
VALUES (TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_prj_book.nextval, 4, '0')
        , 4, 'naver Title', 'naver writer', 4, 'naver book Comment'
);
commit;

----------------------------

CREATE TABLE prj_platform (
platform_id NUMBER(2) --플랫폼 아이디
, platform_name VARCHAR2(100) --플랫폼
);

INSERT into prj_platform
(platform_id, platform_name)
VALUES (2, '네이버시리즈');

ALTER table prj_platform
add CONSTRAINT pk_platform_id
PRIMARY key (platform_id)
REFERENCES prj_book(platform_id);


ALTER TABLE prj_platform
ADD CONSTRAINT fk_platform_id
FOREIGN KEY (platform_id)
REFERENCES prj_book(platform_id);


CREATE TABLE prj_bookmark(
    bookmark_no NUMBER(5)
    , book_no VARCHAR2(100)
    , bookmark_page NUMBER(5)
    , reg_date DATE DEFAULT SYSDATE
    , bookmark_content CLOB
    , CONSTRAINT pk_bookmark_no PRIMARY KEY (bookmark_no)
);

ALTER TABLE prj_bookmark
ADD CONSTRAINT fk_book_no
FOREIGN KEY (book_no)
REFERENCES prj_book(book_no);

CREATE TABLE prj_bookmemo(
    bookmemo_no NUMBER(5)
    , book_no VARCHAR2(100)
    , reg_date DATE DEFAULT SYSDATE
    , bookmemo_content CLOB
    , CONSTRAINT pk_bookmemo_no PRIMARY KEY (bookmemo_no)
);


ALTER TABLE prj_bookmemo
ADD CONSTRAINT fk_book_no2
FOREIGN KEY (book_no)
REFERENCES prj_book(book_no);