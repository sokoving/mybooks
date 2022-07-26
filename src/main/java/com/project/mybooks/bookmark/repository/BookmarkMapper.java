package com.project.mybooks.bookmark.repository;

import com.project.mybooks.bookmark.domain.Bookmark;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookmarkMapper {
//    book
//    등록 boolean save(Book book)
//    수정 boolean modify(Book book)
//    삭제 boolean remove(int book_no)
//    전체 조회 List<Book>findAll()
//    상세 조회 Book findOne(int book_no)
//// 전체 게시물 수 조회 int getTotalCount(Search search

    boolean save(Bookmark bookmark);
    boolean modify(Bookmark bookmark);
    boolean remove(int bookmarkNo);
    List<Bookmark> findAll(String bookNo);
    Bookmark findOne(int bookmarkNo);
    int getTotalCount(String bookNo);

    boolean removeToBookNo(String bookNo);


}
