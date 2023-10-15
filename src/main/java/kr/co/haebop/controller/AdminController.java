package kr.co.haebop.controller;

import kr.co.haebop.domain.*;
import kr.co.haebop.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
    @Autowired
    private CommunityService communityService;
    @Autowired
    private TeacherService teacherService;

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
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private FileInfo2Service fileInfo2Service;
    @Autowired
    private LectureService lectureService;


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

    @GetMapping("adminList.do")		//board/list.do
    public String adminList(Model model) throws Exception {
        List<Fileboard> fileboardList = fileboardService.fileList();
        model.addAttribute("fileboardList", fileboardList);
        return "/admin/adminList";
    }

    @GetMapping("adminuserList.do")
    public String adminuserList(Model model) throws Exception {
        List<User> userList = userService.UserList();
        model.addAttribute("userList", userList);
        return "/admin/adminUserList";
    }

    @RequestMapping(value="userDelete.do", method = RequestMethod.GET)
    public String userDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        userService.UserDelete(id);
        session.invalidate();
        return "redirect: adminUserList.do";
    }

    @GetMapping("adminNoticeList.do")
    private String NoticeList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
        List<Notice> noticeList = noticeService.noticeList();
        model.addAttribute("noticeList",noticeList);
        return "/admin/adminNoticeList";
    }
    @GetMapping("adminNoticedelete.do")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception{
        int seq = Integer.parseInt(request.getParameter("seq"));
        noticeService.noticeDelete(seq);
        return "redirect:adminNoticeList.do";
    }
    @GetMapping("adminTeacherList.do")
    private String teacherList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
        Teacher teacher = new Teacher();
        List<Teacher> teacherList = teacherService.teacherList();
        System.out.println(teacherList);
        model.addAttribute("teacherList",teacherList);
        model.addAttribute("file",teacher.getFileInfos());
        return "/admin/adminTeacher";
    }

    @GetMapping("adminLectureList.do")
    private String lectureList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
        List<Lecture> lectureList = lectureService.lectureList();
        System.out.println(lectureList);
        model.addAttribute("lectureList",lectureList);
        return "/admin/adminLecture";
    }
}
