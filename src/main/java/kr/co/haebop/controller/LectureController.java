package kr.co.haebop.controller;

import kr.co.haebop.domain.Category;
import kr.co.haebop.domain.CommunityVO;
import kr.co.haebop.domain.Fileboard;
import kr.co.haebop.domain.Notice;
import kr.co.haebop.service.CommentService;
import kr.co.haebop.service.CommunityService;
import kr.co.haebop.service.FileboardService;
import kr.co.haebop.service.NoticeService;
import kr.co.haebop.util.CommunityPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("/lecture/*")
public class LectureController {
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
        List<Fileboard> fileboardList = fileboardService.fileList();
        model.addAttribute("fileboardList", fileboardList);
        return "/lecture/main";
    }

    @RequestMapping("korean")
    public String korean(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

        List<Notice> noticeList = noticeService.noticeList();
        model.addAttribute("noticeList",noticeList);
        return "/lecture/korean";
    }

    @RequestMapping("english")
    public String english(Locale locale, Model model) throws Exception {
        return "/lecture/english";
    }

    @RequestMapping("math")
    public String math(Locale locale, Model model) throws Exception {
        return "/lecture/math";
    }
    @RequestMapping("detail.do")
    public String detail(HttpServletRequest request,Locale locale, Model model) throws Exception {
        int seq = Integer.parseInt(request.getParameter("seq"));
        Notice notice = noticeService.noticeDetail(seq);
        model.addAttribute("notice",notice);
        return "/lecture/koreanDetail";
    }
}
