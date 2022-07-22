package com.project.mybooks.book.controller;

import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import com.project.mybooks.book.service.BookDetailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/book")
public class MainController {

    private final BookDetailService bookDetailService;
    // 1. 서비스에서 합친다**
    // 2. 컨트롤러에 하나씩 올린다

    // 중간처리가 각각 필요한가?
    // 서비스 1 (-필드 여러개) : 메퍼 多

    /*
     * 1. 책 리스트 /list (get)
     * 2. 등록화면 /write (get)
     * 3. 등록요청 /write (post)
     * 4. 수정화면 /modify (get)
     * 5. 수정요청 /modify (post)
     * 6. 삭제요청 /delete (get)
     * 7. 상세정보 /detail (get)
     * 8. 북마크내용 수정요청 /detail/bookmark/modify (post)
     * 9. 북마크내용 삭제요청 /detail/bookmark/delete (post)
     * 10.메모내용 수정요청 /detail/bookmemo/modify (post)
     * 11.메모내용 삭제요청 /detail/bookmemo/delete (post)
     * 8./bookmark-modify (post)
     * 9./bookmark-delete (post)
     * 10. /bookmemo-modify (post)
     * 11. /bookmemo-delete (post)
     *
     * 4, 5, 6 구현하기
     */

    // 수정화면 get
    @GetMapping("/modify")
    public String modify(String bookNo, Model model){
        log.info("modify GET - 요청이 들어옴");
        BookPlatform BookPlatform = bookDetailService.detailFindOne(bookNo);
        return "book-modify";
    }

    // 수정화면 post
    /*
    @PostMapping("/modify")
    public String modify(Book book){
        log.info("controller req POST - {}", book);
        boolean result = bookDetailService.detailModify(book);
        return result ? "redirect:/board/detail" + book.getBookNo() : "redirect:/";
    }

     */


    // 삭제정보 get



}
