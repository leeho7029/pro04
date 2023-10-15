package kr.co.haebop.controller;


import kr.co.haebop.domain.Subject;
import kr.co.haebop.service.SubjectService;

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
@RequestMapping("/subject/")
public class SubjectController {
    @Autowired
    private SubjectService subjectService;

    @GetMapping("list.do")
    private String subjectList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
        List<Subject> subjectList = subjectService.subjectList();
        model.addAttribute("subjectList",subjectList);
        return "/subject/subjectList";
    }
    @GetMapping("detail.do")
    public String getsubjectDetail(HttpServletRequest request,Model model) throws Exception{
        int subno = Integer.parseInt(request.getParameter("subno"));
        Subject subject = subjectService.subjectDetail(subno);
        model.addAttribute("subject",subject);
        return "/subject/subjectDetail";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception{
        return "/subject/subjectInsert";
    }

    @PostMapping("insertpro.do")
    public String subjectInsert(HttpServletRequest request,Model model) throws Exception{
        Subject subject = new Subject();
        subject.setTitle(request.getParameter("title"));
        subjectService.subjectInsert(subject);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String subjectDelete(HttpServletRequest request, Model model) throws Exception{
        int subno = Integer.parseInt(request.getParameter("subno"));
        subjectService.subjectDelete(subno);
        return "redirect:list.do";
    }
}
