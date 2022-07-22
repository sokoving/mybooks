package com.project.mybooks.bookmark.repository;
/*
import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.repository.BookMapper;
import com.project.mybooks.bookMemo.domain.BookMemo;
import com.project.mybooks.bookmark.domain.Bookmemo;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BookmemoMapperTest {

    @Autowired
    BookmarkMapper mapper;
    @Autowired
    BookMapper bMapper;


    @Test
    @DisplayName("저장되어야 한다.")
    @Rollback
    void saveTest() {
        Bookmemo bookmark = new Bookmemo();
        bookmark.setBookNo("2207220001");
        bookmark.setBookmarkPage(100);
        bookmark.setBookmarkContent("여기까지 읽음~~");
        boolean result = mapper.save(bookmark);
        assertTrue(result);

    }

//    boolean save(Bookmark bookmark);
//    boolean modify(Bookmark bookmark);
//    boolean remove(int bookNo);
//    List<Bookmark> findAll();
//    Bookmark findOne(int bookNo);

    @Test
    @DisplayName("리스트 전체를 불러와야 한다")
    void findAllTest() {

        List<Bookmemo> bookmarkList = mapper.findAll("220721aa");
        for (Bookmemo bookmark : bookmarkList) {
            System.out.println(bookmark);
        }
    }

    @Test
    @DisplayName("해당번호의 북마크를 불러와야한다.")
    void findOneTest() {
        Bookmemo one = mapper.findOne(1);
        System.out.println(one);
    }

    /*
    @Test
    @DisplayName("수정되어야 한다.")
    void modifyTest() {
        BookMemo bookMemo = mapper.findOne(1);
        bookMemo.setBookmarkContent("수정된 내용");
        bookMemo.setBookmarkPage(10);
        boolean modify = mapper.modify(bookmark);
        assertTrue(modify);
    }



    @Test
    @DisplayName("해당 번호의 북마크가 삭제되어야 한다.")
    void removeTest() {
        boolean flag = mapper.remove(7);
        assertTrue(flag);
    }


}

 */