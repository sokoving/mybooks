package com.project.mybooks.bookMemo.domain;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BookMemo {
    // table 칼럼 필드
    private int bookMemoNo;
    private String bookNo;
    private Date regDate;
    private String bookMemoContent;
}
