package com.project.mybooks.book.repository;

import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BookMapperTest {

    @Autowired
    BookMapper mapper;
/*    @Test
    @DisplayName("Book이 DB에 등록돼야 한다")
    void saveTest(){
        Book b = new Book();
        b.setPlatformId(3);
        b.setBookTitle("test title");
        b.setWriter("test writer");
        b.setStarRate(3);
        b.setBookComment("test comment");

        boolean flag = mapper.save(b);

        assertTrue(flag);
    }*/

    @Test
    @DisplayName("mapper delete book from DB")
    void removeTest(){
        String bookNo = "2207210022";
        boolean b = mapper.remove(bookNo);
        assertTrue(b);
    }

    @Test
    @DisplayName("mapper find All books from DB")
    void findAll(){
        List<BookPlatform> all = mapper.findAll();
        for (BookPlatform b : all) {
            System.out.println(b);
        }
    }

}