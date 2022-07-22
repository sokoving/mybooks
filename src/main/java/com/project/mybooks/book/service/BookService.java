package com.project.mybooks.book.service;

import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import com.project.mybooks.book.repository.BookMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookService {

    private final BookMapper bMapper;

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

    public int getTotalService() {
        return bMapper.getTotalCount();
    }
}
