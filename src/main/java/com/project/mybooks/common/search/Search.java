package com.project.mybooks.common.search;

import com.project.mybooks.common.paging.Page;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString @NoArgsConstructor
public class Search extends Page {

    // 검색은 페이징이 필수적 > 의존관계(컴포지션)
    private String type; // 검색 조건
    private String keyword; // 검색 키워드

    public Search(int pageNum, int amount, String type, String keyword) {
        super(pageNum, amount);
        this.type = type;
        this.keyword = keyword;
    }

    public static void main(String[] args) {
        Search search = new Search();
        System.out.println(search);
    }
}