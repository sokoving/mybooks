package com.project.mybooks.book.controller;

import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import com.project.mybooks.book.service.BookDetailService;
import com.project.mybooks.book.service.BookService;
import com.project.mybooks.bookMemo.domain.BookMemo;
import com.project.mybooks.bookMemo.service.BookMemoService;
import com.project.mybooks.bookmark.service.BookmarkService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/book")
public class MainController {
    private final BookService bs;
    private final BookmarkService bmks;
    private final BookMemoService bmms;
    private final BookDetailService bdts;

    /* 여운
     * 1. 책 리스트 /list (get)
     * 2. 등록화면 /write (get)
     * 3. 등록요청 /write (post)
     */

    /* 성렬
     * 1. 상세정보 /detail (get)
     * 2. 북마크내용 수정요청 /bookmark-modify (post)
     * 3. 북마크내용 삭제요청 /bookmark-delete (post)
     * 4. 북마크내용 등록요청 /bookmark-save (post)
     * 5. 메모내용 수정요청 /bookmemo-modify (post)
     * 6. 메모내용 삭제요청 /bookmemo-delete (post)
     * 7. 메모내용 등록요청 /bookmark-save (post)
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








    @GetMapping("/detail")
    public String detail(String bookNo, Model model) {
        log.info("controller request /book/detail GET - {}", bookNo);

        Map<String, Object> detailPageListMap = bdts.detailPageListMap(bookNo);

        model.addAttribute("book", detailPageListMap.get("book"));
        model.addAttribute("bmkl",detailPageListMap.get("bookMarkList"));
        model.addAttribute("bmml", detailPageListMap.get("bookMemoList"));

        return "/book/detail";
    }


    // bookmark

    @PostMapping("/bookmark-modify")
    public String bookmarkModify(@RequestBody Bookmark bookmark) {
        log.info("controller request /book/bookmark-modify POST - {}", bookmark);

        boolean flag = bmks.modifyService(bookmark);

        return  flag ? "redirect:/book/detail" : "redirect:/";

    }

    @PostMapping("/bookmark-delete")
    public String bookmarkDelete(int bookmarkNo) {
//        int bookmarkNo = 1;
        log.info("controller request /book/bookmark-delete POST - {}", bookmarkNo);
        boolean flag = bmks.removeService(bookmarkNo);

        return flag ? "redirect:/book/detail" : "redirect:/";
    }

    @PostMapping("/bookmark-save")
    public String bookmarkSave(@RequestBody Bookmark bookmark) {
        log.info("controller request /book/bookmark-save POST - {}", bookmark);

        boolean flag = bmks.saveService(bookmark);

        return flag ? "redirect:/book/detail" : "redirect:/";
    }



    // bookmemo
    @PostMapping("/bookmemo-modify")
    public String bookmemoModify(@RequestBody BookMemo bookMemo) {
        log.info("controller request /book/bookmemo-modify POST - {}", bookMemo);

        boolean flag = bmms.modifyService(bookMemo);

        return  flag ? "redirect:/book/detail" : "redirect:/";

    }

    @PostMapping("/bookmemo-delete")
    public String bookmemoDelete() {
        int bookmemeoNo = 3;
        log.info("controller request /book/bookmemo-delete POST - {}", bookmemeoNo);

        boolean flag = bmms.removeService(bookmemeoNo);

        return flag ? "redirect:/book/detail" : "redirect:/";
    }

    @PostMapping("/bookmemo-save")
    public String bookmemoSave(@RequestBody BookMemo bookMemo) {
        log.info("controller request /book/bookmemo-save POST - {}", bookMemo);

        boolean flag = bmms.saveService(bookMemo);

        return flag ? "redirect:/book/detail" : "redirect:/";
    }



}
