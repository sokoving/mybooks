package com.project.mybooks.bookmark.service;

import com.project.mybooks.bookmark.domain.Bookmark;
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

    public boolean saveService(Bookmark bookmark) {
        return mapper.save(bookmark);
    }

    public boolean modifyService(Bookmark bookmark) {
        return mapper.modify(bookmark);
    }

    public boolean removeService(int bookMemoNo) {
        return mapper.remove(bookMemoNo);
    }

    public List<Bookmark> findAllService(String bookNo) {
        return mapper.findAll(bookNo);
    }

    public Bookmark findOneService(int bookMemoNo) {
        return mapper.findOne(bookMemoNo);
    }

    public int getTotalCntService(String bookNo) {
        return mapper.getTotalCount(bookNo);
    }

    public boolean removeToBookNo(String bookNo) {
        return mapper.removeToBookNo(bookNo);
    }
}
