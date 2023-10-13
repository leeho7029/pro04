package kr.co.haebop.controller;

import kr.co.haebop.domain.Category;
import kr.co.haebop.domain.Community;
import kr.co.haebop.domain.Fileboard;
import kr.co.haebop.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
    @Autowired
    private CommunityService communityService;

    @Autowired
    private CommentService commentService;
    @Autowired
    HttpSession session;
    @Autowired
    private FileboardService fileboardService;
    @Autowired
    private FileInfoService fileInfoService;
    @Autowired
    private UserService userService;


    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        List<Category> categories = communityService.categoryList();
        model.addAttribute("categories", categories);
        return "/admin/adminLectureInsert";
    }

    @PostMapping("insert.do")
    public String communityInsert(Community community, HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        community.setAuthor((String)session.getAttribute("sid"));
        communityService.communityInsert(community);
        return "redirect:list.do";
    }
    @GetMapping("adminFileList.do")		//board/list.do
    public String getBoardList(Model model) throws Exception {
        List<Fileboard> fileboardList = fileboardService.fileList();
        model.addAttribute("fileboardList", fileboardList);
        return "/admin/adminFileboardList";
    }
    @GetMapping("delete.do")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception {
        int articleno = Integer.parseInt(request.getParameter("articleno"));
        fileboardService.fileboardDelete(articleno);
        return "redirect:adminList.do";
    }
    @GetMapping("adminList.do")		//board/list.do
    public String adminList(Model model) throws Exception {
        List<Fileboard> fileboardList = fileboardService.fileList();
        model.addAttribute("fileboardList", fileboardList);
        return "/admin/adminList";
    }
}
