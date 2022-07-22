package com.project.mybooks.book.controller;

import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import com.project.mybooks.book.service.BookService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/book")
public class MainController {

    private final BookService bService;

    /*
     * 1. 책 리스트 /list (get)
     * 2. 등록화면 /write (get)
     * 3. 등록요청 /write (post)
     */

    @GetMapping("/list")
    public String list(Model model) {
        log.info("Main Controller - list GET 요청");
        List<BookPlatform> bookPlatformList = bService.findAllService();
        log.info(bookPlatformList);

        model.addAttribute("bpList", bookPlatformList);

        boolean tyep = false;

        return "book-list";
    }

    @GetMapping("/write")
    public String write() {
        log.info("Main Controller : write GET 요청");
        return "book-save";
    }

    @PostMapping("/write")
    public String write(Book book) {
        log.info("Main Controller : write POST 요청 - {}", book);
        boolean b = bService.saveService(book);
        log.info("flag - {}", b);
        return "redirect:/list";
    }




}
