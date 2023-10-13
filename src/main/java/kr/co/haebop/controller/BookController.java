package kr.co.haebop.controller;

import kr.co.haebop.domain.Fileboard;
import kr.co.haebop.domain.Notice;
import kr.co.haebop.service.CommentService;
import kr.co.haebop.service.CommunityService;
import kr.co.haebop.service.FileboardService;
import kr.co.haebop.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Locale;
@Controller
@RequestMapping("/book/")
public class BookController {
    @Autowired
    private CommunityService communityService;

    @Autowired
    private CommentService commentService;
    @Autowired
    private NoticeService noticeService;
    @Autowired
    HttpSession session;
    @Autowired
    private FileboardService fileboardService;
    @RequestMapping("home")
    public String home(Locale locale, Model model) throws Exception {
        List<Notice> noticeList = noticeService.noticeList();
        model.addAttribute("noticeList",noticeList);

        return "/book/bookList";
    }
}
