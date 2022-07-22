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

    @Test
    @DisplayName("저장된 모든 값을 불러와야한다")
    void findAllTest(){
        mapper.findAll("220721aa").forEach(System.out::println);
    }

    @Test
    @DisplayName("지정한 하나의 값을 불러와야한다")
    void findOneTest(){
        int find = 4;
        BookMemo result = mapper.findOne(find);
        System.out.println(result);

        assertEquals(result.getBookMemoNo(), 4);
    }

    @Test
    @DisplayName("지정된 값을 수정해야한다")
    void modifyTest(){
        BookMemo one = mapper.findOne(4);
        one.setBookMemoContent("하하하하");
        boolean modify = mapper.modify(one);
        System.out.println(one);
        assertTrue(modify);
    }

    @Test
    @DisplayName("저장된 전체 값 조회")
    void getAllcountTest(){
        int totalCount = mapper.getTotalCount();
        System.out.println(totalCount);
        assertEquals(totalCount, 4);
    }
}