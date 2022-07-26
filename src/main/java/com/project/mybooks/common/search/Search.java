package com.project.mybooks.common.search;

import com.project.mybooks.common.paging.Page;
import lombok.*;

@Setter @Getter @ToString
public class Search extends Page {

    // 검색은 페이징이 필수적 > 의존관계(컴포지션)
    private String bKey; // 제목 검색 키워드
    private String wKey; // 작가 검색 키워드
    private int platformId;
    private int starRate;
    private String bookTitle;
    private String writer;
    private String type;

    public Search() {
        System.out.println("!! Search 기본 생성자 호출 !!");
    }

    public Search(int pageNum, int amount, String bKey, String wKey, int platformId, int starRate, String bookTitle, String writer) {
        super(pageNum, amount);
        System.out.println("!! Search 전체 생성자 호출 !!");
        this.bKey = bKey;
        this.wKey = wKey;
        this.platformId = platformId;
        this.starRate = starRate;
        this.bookTitle = bookTitle;
        this.writer = writer;
    }

}