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
    @DisplayName("Book이 DB에 등록돼야 한다")
    void saveTest(){
        System.out.println("startstart");
        Book b = new Book();
        System.out.println("b = " + b);
        b.setPlatformId(3);
        b.setBookTitle("test title");
        b.setWriter("test writer");
        b.setStarRate(3);
        b.setBookComment("test comment");
        System.out.println("b = " + b);

        boolean flag = mapper.save(b);

        assertTrue(flag);
    }

}