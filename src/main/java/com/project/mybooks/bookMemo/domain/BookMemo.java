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
    private int BookMemoNo;
    private String BookNo;
    private Date RegDate;
    private String BookMemoContent;
}
