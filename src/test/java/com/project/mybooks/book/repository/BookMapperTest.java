package com.project.mybooks.book.repository;

import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BookMapperTest {

    @Autowired
    BookMapper mapper;
    
    @Test
    @DisplayName("테스트가 실행돼야 한다")
    void test(){
        System.out.println("!! test !!");
    }

     @Test
    @DisplayName("Book이 DB에 등록돼야 한다")
    void saveTest(){
        System.out.println("startstart");
        Book b = new Book();
        System.out.println("b = " + b);
        b.setPlatformId(1);
        b.setBookTitle("test title1");
        b.setWriter("test writer1");
        b.setStarRate(3);
        b.setBookComment("test comment1");
        b.setCurPage(10);
        b.setTotalPage(100);
        b.setTheEnd(0);
        System.out.println("b = " + b);

        boolean flag = mapper.save(b);

        assertTrue(flag);
    }

    @Test
    @DisplayName("DB에서 정보가 삭제돼야 한다")
    void removeTest(){
        String bookNo = "2207220025";
        boolean flag = mapper.remove(bookNo);
        assertTrue(flag);
    }

    @Test
    @DisplayName("DB에서 정보가 수정돼야 한다")
    void modifyTest(){

        System.out.println("startstart");
        Book b = new Book();
        System.out.println("b = " + b);
        b.setBookNo("2207220026");
        b.setPlatformId(1);
        b.setBookTitle("test title2");
        b.setWriter("test writer2");
        b.setStarRate(4);
        b.setBookComment("test comment333");
        b.setCurPage(5);
        b.setTotalPage(50);
        b.setTheEnd(0);
        System.out.println("b = " + b);
        boolean modify = mapper.modify(b);

        assertTrue(modify);

//        assertEquals(b.getBookTitle(), "test comment333");
    }

    @Test
    @DisplayName("DB에서 prj_book과 prj_platform가 조인돼서 전체 조회돼야 한다")
    void findAllTest(){
        List<BookPlatform> all = mapper.findAll();
        for (BookPlatform b : all) {
            System.out.println(b);
        }
    }

    @Test
    @DisplayName("DB에서 특정 정보가 조회돼야 한다")
    void findOneTest(){
        String bn = "2207220027";
        BookPlatform one = mapper.findOne(bn);
        System.out.println(one);
    }

    @Test
    @DisplayName("DB에서 특정한 Book을 조회해야한다")
    void findBookOneTest(){
        String bn = "220721aa";
        Book book = mapper.findBookOne(bn);
        System.out.println("book = " + book);
//        assertEquals(book.getBookNo(), "220721aa");
    }

    @Test
    @DisplayName("prj_book 테이블의 데이터 수 리턴")
    void getTotalCount(){
        int totalCount = mapper.getTotalCount();
        assertEquals(2, totalCount);
    }

}