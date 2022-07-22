INSERT INTO prj_book
(user_id, importance, book_no, platform_id
, book_title, writer, star_rate , book_comment ,cur_page, total_page
, the_end
)
VALUES ('aaa123',100, '220721aa', 10, '괴물공작가의 계약 공녀','민작', 4
, '재미있었다', 30 , 400, 'T');

SELECT
    * FROM prj_book;

SELECT
    * FROM prj_bookmemo;

INSERT INTO prj_bookmemo
    (bookmemo_no, book_no,  bookmemo_content)
    VALUES
    (seq_book_bookmemo.NEXTVAL, '220721aa', 'good~~~~');

    commit;