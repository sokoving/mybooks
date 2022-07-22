package com.project.mybooks.bookMemo.repository;

import com.project.mybooks.bookMemo.domain.BookMemo;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BookMemoMapperTest {
    @Autowired
    BookMemoMapper mapper;

    @Test
    @DisplayName("값이 들어가야한다")
    void insertTest(){
        BookMemo memo = new BookMemo();
        memo.setBookNo("220721aa");
        memo.setBookMemoContent("재미있다!!");

        boolean result = mapper.save(memo);

        assertTrue(result);
    }

    @Test
    @DisplayName("값을 삭제해야 한다")
    void deleteTest(){
        boolean result = mapper.remove(5);

        assertTrue(result);
    }
}