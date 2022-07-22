package com.project.mybooks.bookmark.service;

import com.project.mybooks.bookmark.domain.Bookmemo;
import com.project.mybooks.bookmark.repository.BookmarkMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class BookmarkService {

    private final BookmarkMapper mapper;

    public boolean saveService(Bookmemo bookmark) {
        return mapper.save(bookmark);
    }

    public boolean modifyService(Bookmemo bookmark) {
        return mapper.modify(bookmark);
    }

    public boolean removeService(int bookMemoNo) {
        return mapper.remove(bookMemoNo);
    }

    public List<Bookmemo> findAllService() {
        return mapper.findAll();
    }

    public Bookmemo findOneService(int bookMemoNo) {
        return mapper.findOne(bookMemoNo);
    }

}
