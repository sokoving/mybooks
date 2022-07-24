package com.project.mybooks.book.service;

import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import com.project.mybooks.book.repository.BookMapper;
import com.project.mybooks.bookMemo.repository.BookMemoMapper;
import com.project.mybooks.bookmark.repository.BookmarkMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class BookService {

    private final BookMapper bMapper;
    private final BookmarkMapper bmkMapper;
    private final BookMemoMapper bmmMapper;

    public boolean saveService(Book book) {
        return bMapper.save(book);
    }

    public boolean modifyService(Book book) {
        return bMapper.modify(book);
    }

    public boolean removeService(String bookNo) {
        return bMapper.remove(bookNo);
    }

    public List<BookPlatform> findAllService() {
        return bMapper.findAll();
    }

    public BookPlatform findOneService(String bookNo) {
        return bMapper.findOne(bookNo);
    }

    public Book findBookOne(String bookNo){
        return bMapper.findBookOne(bookNo);
    }

    public int getTotalService() {
        return bMapper.getTotalCount();
    }
}
