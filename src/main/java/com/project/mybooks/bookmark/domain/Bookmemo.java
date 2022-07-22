package com.project.mybooks.bookmark.domain;


import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Bookmemo {

//    bookmark_no NUMBER(5)
//    , book_no VARCHAR2(100)
//    , bookmark_page NUMBER(5)
//    , reg_date DATE DEFAULT SYSDATE
//    , bookmark_content CLOB
//    , CONSTRAINT pk_bookmark_no PRIMARY KEY (bookmark_no)

    private int bookmarkNo;
    private String bookNo;
    private int bookmarkPage;
    private Date regDate;
    private String bookmarkContent;

    public Bookmemo(int bookmarkNo, String bookNo, int bookmarkPage, String bookmarkContent) {
        this.bookmarkNo = bookmarkNo;
        this.bookNo = bookNo;
        this.bookmarkPage = bookmarkPage;
        this.bookmarkContent = bookmarkContent;
    }
}
