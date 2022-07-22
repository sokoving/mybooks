package com.project.mybooks.bookMemo.service;

import com.project.mybooks.bookMemo.domain.BookMemo;
import com.project.mybooks.bookMemo.repository.BookMemoMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class BookMemoService {

    private final BookMemoMapper mapper;

    public boolean saveService(BookMemo bookmemo) {
        return mapper.save(bookmemo);
    }

    public boolean modifyService(BookMemo bookmemo) {
        return mapper.modify(bookmemo);
    }

    public boolean removeService(int bookMemoNo) {
        return mapper.remove(bookMemoNo);
    }

    public List<BookMemo> findAllService(String bookNo) {
        return mapper.findAll(bookNo);
    }

    public BookMemo findOneService(int bookMemoNo) {
        return mapper.findOne(bookMemoNo);
    }

}
