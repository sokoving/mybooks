package com.project.mybooks.book.repository;

import com.project.mybooks.book.domain.Book;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

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

}