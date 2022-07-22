package com.project.mybooks.book.repository;


import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {

        // 게시글 쓰기 기능
        boolean save(Book book);

        // 게시글 전체 조회
        List<BookPlatform> findAll();
//        List<Board> findAll2(Search search);

        // 게시글 상세 조회
        BookPlatform findOne(String bookNo);

        // 게시글 삭제
        boolean remove(String bookNo);

        // 게시글 수정
        boolean modify(Book book);

        // 전체 게시물 수 조회
        int getTotalCount();
//        int getTotalCount(Search search);

        Book findBookOne(String bookNo);
}
