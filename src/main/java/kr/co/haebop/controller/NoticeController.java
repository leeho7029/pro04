package kr.co.haebop.controller;

import kr.co.haebop.domain.Notice;
import kr.co.haebop.service.NoticeService;
import kr.co.haebop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @GetMapping("list.do")
    private String NoticeList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
        List<Notice> noticeList = noticeService.noticeList();
        model.addAttribute("noticeList",noticeList);
        return "/notice/noticeList";
    }
    @GetMapping("detail.do")
    public String getNoticeDetail(HttpServletRequest request,Model model) throws Exception{
        int seq = Integer.parseInt(request.getParameter("seq"));
        Notice notice = noticeService.noticeDetail(seq);
        model.addAttribute("notice",notice);
        return "/notice/noticeDetail";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception{
        return "/notice/noticeInsert";
    }

    @PostMapping("insert.do")
    public String noticeInsert(HttpServletRequest request,Model model) throws Exception{
        Notice notice = new Notice();
        notice.setTitle(request.getParameter("title"));
        notice.setContent(request.getParameter("content"));
        noticeService.noticeInsert(notice);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception{
        int seq = Integer.parseInt(request.getParameter("seq"));
        noticeService.noticeDelete(seq);
        return "redirect:list.do";
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int seq = Integer.parseInt(request.getParameter("seq"));
        Notice notice = new Notice();
        notice.setSeq(seq);
        notice.setTitle(request.getParameter("title"));
        notice.setContent(request.getParameter("content"));
        noticeService.noticeEdit(notice);
        return "redirect:list.do";
    }

}
