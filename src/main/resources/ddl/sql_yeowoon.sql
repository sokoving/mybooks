----------- drop ----------- 

drop SEQUENCE seq_prj_book;
drop SEQUENCE seq_prj_platform;
drop SEQUENCE seq_book_bookmark;
drop SEQUENCE seq_book_bookmemo;
drop TABLE prj_bookmark;
drop TABLE prj_bookmemo;
drop table prj_book;
drop TABLE prj_platform;

commit;

----------- create ----------- 
CREATE SEQUENCE seq_prj_book;
CREATE SEQUENCE seq_prj_platform;
CREATE SEQUENCE seq_book_bookmemo;
CREATE SEQUENCE seq_book_bookmark;

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
, the_end NUMBER(1) DEFAULT 1 --완결 0 연재중 1
, reg_date DATE DEFAULT SYSDATE    -- 등록 날짜
, CONSTRAINT pk_book_no PRIMARY KEY (book_no)
);

CREATE TABLE prj_platform (
platform_id NUMBER(2) --플랫폼 아이디
, platform_name VARCHAR2(100) not null --플랫폼
, CONSTRAINT pk_platform_no PRIMARY KEY (platform_id)
);

CREATE TABLE prj_bookmark(
    bookmark_no NUMBER(5)
    , book_no VARCHAR2(100) not null
    , bookmark_page NUMBER(5)not null
    , reg_date DATE DEFAULT SYSDATE
    , bookmark_content CLOB not null
    , CONSTRAINT pk_bookmark_no PRIMARY KEY (bookmark_no)
);


CREATE TABLE prj_bookmemo(
    bookmemo_no NUMBER(5)
    , book_no VARCHAR2(100) not null
    , reg_date DATE DEFAULT SYSDATE
    , bookmemo_content CLOB not null
    , CONSTRAINT pk_bookmemo_no PRIMARY KEY (bookmemo_no)
);


------------ Foreign key ----------------


ALTER TABLE prj_book
ADD CONSTRAINT fk_platform_id
FOREIGN KEY (platform_id)
REFERENCES prj_platform(platform_id);

ALTER TABLE prj_bookmark
ADD CONSTRAINT fk_book_no
FOREIGN KEY (book_no)
REFERENCES prj_book(book_no);


ALTER TABLE prj_bookmemo
ADD CONSTRAINT fk_book_no2
FOREIGN KEY (book_no)
REFERENCES prj_book(book_no);

commit;

----------- insert into ----------- 

insert into prj_platform VALUES (seq_prj_platform.nextval, '카카오 페이지');
insert into prj_platform VALUES (seq_prj_platform.nextval, '네이버 시리즈');
insert into prj_platform VALUES (seq_prj_platform.nextval, '리디북스');
insert into prj_platform VALUES (seq_prj_platform.nextval, '문피아');
insert into prj_platform VALUES (seq_prj_platform.nextval, '조아라');
insert into prj_platform VALUES (seq_prj_platform.nextval, '기타');
commit;


INSERT INTO prj_book
(user_id, importance, book_no, platform_id
, book_title, writer, star_rate , book_comment ,cur_page, total_page
, the_end)
VALUES ('aaa123',100, '220721aa', 3, '괴물공작가의 계약 공녀','민작', 4
, '재미있었다', 30 , 400, 0);

INSERT INTO prj_book
(
    book_no
    , platform_id, book_title, writer, star_rate, book_comment
    , cur_page, total_page, the_end
    )
VALUES (
        TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_prj_book.nextval, 4, '0')
        , 1, 'bookTitle', 'writer', 5, 'bookComment'
        , 10, 100, 1
        );
commit;

INSERT INTO prj_bookmemo
(bookmemo_no, book_no, bookmemo_content)
VALUES
(seq_book_bookmemo.NEXTVAL, '2207220002', '재미있다');
commit;

INSERT INTO prj_bookmark (bookmark_no, book_no, bookmark_page, bookmark_content)
VALUES ( seq_book_bookmark.nextval, '2207220002', '300', '300300300');

INSERT INTO prj_bookmark (bookmark_no, book_no, bookmark_page, bookmark_content)
VALUES ( seq_book_bookmark.nextval, '220721aa', '300', '300300300');
commit;
------------
        SELECT
            a.user_id, a.importance
            , a.book_no, a.platform_id, b.platform_name
            , a.book_title, a.writer, a.star_rate, a.book_comment
            , a.cur_page, a.total_page, a.the_end, a.reg_date
        FROM prj_book a
        LEFT OUTER JOIN prj_platform b
        ON a.platform_id = b.platform_id
        ORDER BY a.book_no DESC
        ;

        SELECT * 
        FROM prj_bookmark
        WHERE book_no = '2207220002'
        ORDER BY bookmark_no DESC;
        
                SELECT * 
        FROM prj_bookmemo
        WHERE book_no = '2207220002'
        ORDER BY bookmemo_no DESC;
        
SELECT count(*)
FROM prj_book
;
        
        
