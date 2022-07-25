package com.project.mybooks.book.controller;

import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import com.project.mybooks.book.service.BookDetailService;
import com.project.mybooks.book.service.BookService;
import com.project.mybooks.bookMemo.domain.BookMemo;
import com.project.mybooks.bookMemo.service.BookMemoService;
import com.project.mybooks.bookmark.domain.Bookmark;
import com.project.mybooks.bookmark.service.BookmarkService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/book")
public class MainController {
    private final BookService bService;
    private final BookmarkService bmks;
    private final BookMemoService bmms;
    private final BookDetailService bdts;

    /* 여운
     * 1. 책 리스트 /list (get)
     * 2. 등록화면 /write (get)
     * 3. 등록요청 /write (post)

     지현
     * 4. 수정화면 /modify (get)
     * 5. 수정요청 /modify (post)
     * 6. 삭제요청 /delete (get)

     성렬
     * 7. 상세정보 /detail (get)
     * 8. 북마크내용 수정요청 /bookmark-modify (post)
     * 9. 북마크내용 삭제요청 /bookmark-delete (post)
     * 10. 북마크내용 등록요청 /bookmark-save (post)
     * 11. 메모내용 수정요청 /bookmemo-modify (post)
     * 12. 메모내용 삭제요청 /bookmemo-delete (post)
     * 13. 메모내용 등록요청 /bookmark-save (post)
     */


    // 1. 책 리스트 /list (get)
    @GetMapping("/list")
    public String list(Model model) {
        log.debug("Main Controller - list GET 요청");
        List<BookPlatform> bookPlatformList = bService.findAllService();
        log.info(bookPlatformList);

        model.addAttribute("bpList", bookPlatformList);

        return "book/book-list";
    }

    // 2. 등록화면 /write (get)
    @GetMapping("/write")
    public String write() {
        log.info("Main Controller : write GET 요청");
        return "book/book-save";
    }

    // 3. 등록요청 /write (post)
    @PostMapping("/write")
    public String write(Book book) {
        log.info("Main Controller : write POST 요청 - {}", book);
        boolean b = bService.saveService(book);
        log.info("flag - {}", b);
        return "redirect:/book/list";
    }

    // ===============================

    // 4.수정화면 get
    @GetMapping("/modify")
    public String modify(String bookNo, Model model){
        log.info("modify GET - 요청이 들어옴- {}", bookNo);
        Book book = bdts.detailFindBookOne(bookNo);
        model.addAttribute("modibook", book);
        return "book/book-modify";
    }

    // 5. 수정화면 post

    @PostMapping("/modify")
    public String modify(Book book){
        log.info("controller req POST - {}", book);
        boolean result = bdts.detailModify(book);
        return result ? "redirect:/book/detail?bookNo=" + book.getBookNo() : "redirect:/";


    }

    // 6. 삭제기능
    @RequestMapping("/delete")
    public String delete(String bookNo){
        log.info("mainController req GET - {}", bookNo);
        boolean delete = bdts.detailDelete(bookNo);
        return delete ? "redirect:/book/list" : "redirect:/";
    }







    //     * 7. 상세정보 /detail (get)
    @GetMapping("/detail")
    public String detail(String bookNo, Model model) {
        log.info("controller request /book/detail GET - {}", bookNo);

        Map<String, Object> detailPageListMap = bdts.detailPageListMap(bookNo);

//        BookPlatform book = (BookPlatform) detailPageListMap.get("book");
//        List<Bookmark> bmkl = new ArrayList<>();



        model.addAttribute("book", detailPageListMap.get("book"));
        model.addAttribute("bmkl", detailPageListMap.get("bookMarkList"));
        model.addAttribute("bmml", detailPageListMap.get("bookMemoList"));


//        System.out.println("!!!!");
//        System.out.println(model.getAttribute("book"));
//        System.out.println("================================");
//        Object bmkl = model.getAttribute("bmkl");
//        System.out.println("================================");
//        System.out.println(model.getAttribute("bmml"));


        return "book/book-detail";
    }


    //     * 8. 북마크내용 수정요청 /bookmark-modify (post)
    @PostMapping("/bookmark-modify")
    public String bookmarkModify(Bookmark bookmark) {

        boolean flag = bmks.modifyService(bookmark);
        String bookNo = bookmark.getBookNo();
        return  flag ? "redirect:/book/detail?bookNo=" + bookNo : "redirect:/";

    }


    //     * 9. 북마크내용 삭제요청 /bookmark-delete (post)
    @PostMapping("/bookmark-delete")
    public String bookmarkDelete(int bookmarkNo) {
//        int bookmarkNo = 1;
        log.info("controller request /book/bookmark-delete POST - {}", bookmarkNo);
        String bookNo = bmks.findOneService(bookmarkNo).getBookNo();
        boolean flag = bmks.removeService(bookmarkNo);

        return flag ? "redirect:/book/detail?bookNo="+ bookNo : "redirect:/";
    }


    //     * 10. 북마크내용 등록요청 /bookmark-save (post)
    @PostMapping("/bookmark-save")
    public String bookmarkSave(Bookmark bookmark) {
        log.info("controller request /book/bookmark-save POST - {}", bookmark);

        boolean flag = bmks.saveService(bookmark);

        return flag ? "redirect:/book/detail?bookNo="+bookmark.getBookNo() : "redirect:/";
    }

    //     * 11. 메모내용 수정요청 /bookmemo-modify (post)
    @PostMapping("/bookmemo-modify")
    public String bookmemoModify(BookMemo bookMemo) {
        log.info("controller request /book/bookmemo-modify POST - {}", bookMemo);

        boolean flag = bmms.modifyService(bookMemo);

        String bookNo = bookMemo.getBookNo();
        return  flag ? "redirect:/book/detail?bookNo="+bookNo : "redirect:/";

    }

    //     * 12. 메모내용 삭제요청 /bookmemo-delete (post)
    @PostMapping("/bookmemo-delete")
    public String bookmemoDelete(int bookmemoNo) {

        log.info("controller request /book/bookmemo-delete POST - {}", bookmemoNo);
        String bookNo = bmms.findOneService(bookmemoNo).getBookNo();
        boolean flag = bmms.removeService(bookmemoNo);

        return flag ? "redirect:/book/detail/detail?bookNo="+bookNo : "redirect:/";
    }

    //     * 13. 메모내용 등록요청 /bookmark-save (post)
    @PostMapping("/bookmemo-save")
    public String bookmemoSave(BookMemo bookMemo) {
        log.info("controller request /book/bookmemo-save POST - {}", bookMemo);

        boolean flag = bmms.saveService(bookMemo);

        return flag ? "redirect:/book/detail?bookNo="+bookMemo.getBookNo() : "redirect:/";
    }

}
