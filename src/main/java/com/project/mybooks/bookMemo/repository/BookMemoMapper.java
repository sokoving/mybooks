package com.project.mybooks.bookMemo.repository;

import com.project.mybooks.bookMemo.domain.BookMemo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMemoMapper {
    // 저장
    boolean save(BookMemo bookMemo);
    // 삭제
    boolean remove(int BookMemoNo);
    // 수정
    boolean modify(BookMemo bookMemo);
    // 전체조회
    List<BookMemo> findAll(String bookNo);
    // 상세조회
    BookMemo findOne(int BookMemoNo);
    // 전체 게시물 수 조회
    int getTotalCount(String bookNo);

    boolean removeToBookNo(String bookNo);

}
