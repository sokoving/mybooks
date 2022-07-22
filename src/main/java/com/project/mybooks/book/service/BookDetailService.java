package com.project.mybooks.book.service;

import com.project.mybooks.book.domain.BookPlatform;
import com.project.mybooks.book.repository.BookMapper;
import com.project.mybooks.bookMemo.domain.BookMemo;
import com.project.mybooks.bookMemo.repository.BookMemoMapper;
import com.project.mybooks.bookmark.domain.Bookmark;
import com.project.mybooks.bookmark.repository.BookmarkMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class BookDetailService {
    private final BookMapper bMapper;
    private final BookmarkMapper mkMapper;
    private final BookMemoMapper mmMapper;

    public Map<String, Object> detailPageListMap(String bookNo){
        BookPlatform book = bMapper.findOne(bookNo);
        // bookNo
        List<Bookmark> bookMarkList = mkMapper.findAll(bookNo);
        List<BookMemo> bookMemoList = mmMapper.findAll(bookNo);

        Map<String, Object> detailMap = new HashMap<>();

        detailMap.put("book", book);
        detailMap.put("bookMarkList", bookMarkList);
        detailMap.put("bookMemoList", bookMemoList);

        return detailMap;
    }

    public BookPlatform detailFindOne(String bookNo){
        BookPlatform findOneBook = bMapper.findOne(bookNo);
        return findOneBook;
    }

    /*
    public boolean detailModify(BookPlatform bookPlatform) {
       log.info("bookdetail service req - {}", bookPlatform);

        return modify;
    }

     */

}
