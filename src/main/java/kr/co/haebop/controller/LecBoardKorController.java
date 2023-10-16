package kr.co.haebop.controller;

import kr.co.haebop.domain.LecBoardKor;
import kr.co.haebop.service.LecBoardKorService;

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
@RequestMapping("/lecBoardKor/*")
public class LecBoardKorController {
    @Autowired
    private LecBoardKorService lecBoardKorService;

    @GetMapping("list.do")
    private String LecBoardKorList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
        List<LecBoardKor> LecBoardKorList = lecBoardKorService.LecBoardKorList();
        model.addAttribute("LecBoardKorList",LecBoardKorList);
        return "/lecBoardKor/lecBoardKorList";
    }
    @GetMapping("detail.do")
    public String getLecBoardKorDetail(HttpServletRequest request,Model model) throws Exception{
        int seq = Integer.parseInt(request.getParameter("seq"));
        LecBoardKor LecBoardKor = lecBoardKorService.LecBoardKorDetail(seq);
        model.addAttribute("LecBoardKor",LecBoardKor);
        return "/lecBoardKor/lecBoardKorDetail";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception{
        return "/lecBoardKor/lecBoardKorInsert";
    }

    @PostMapping("insert.do")
    public String LecBoardKorInsert(HttpServletRequest request,Model model) throws Exception{
        LecBoardKor LecBoardKor = new LecBoardKor();
        LecBoardKor.setTitle(request.getParameter("title"));
        LecBoardKor.setContent(request.getParameter("content"));
        lecBoardKorService.LecBoardKorInsert(LecBoardKor);
        return "redirect:detail.do";
    }

    @GetMapping("delete.do")
    public String LecBoardKorDelete(HttpServletRequest request, Model model) throws Exception{
        int seq = Integer.parseInt(request.getParameter("seq"));
        lecBoardKorService.LecBoardKorDelete(seq);
        return "redirect:list.do";
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int seq = Integer.parseInt(request.getParameter("seq"));
        LecBoardKor LecBoardKor = new LecBoardKor();
        LecBoardKor.setSeq(seq);
        LecBoardKor.setTitle(request.getParameter("title"));
        LecBoardKor.setContent(request.getParameter("content"));
        lecBoardKorService.LecBoardKorEdit(LecBoardKor);
        return "redirect:list.do";
    }

}
