package kr.co.haebop.controller;

import kr.co.haebop.domain.Lecture;
import kr.co.haebop.domain.Register;
import kr.co.haebop.domain.Subject;
import kr.co.haebop.domain.User;
import kr.co.haebop.repository.LectureRepository;
import kr.co.haebop.repository.RegisterRepository;
import kr.co.haebop.service.LectureService;
import kr.co.haebop.service.RegisterService;
import kr.co.haebop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/register/")
public class RegisterController {
    @Autowired
    RegisterRepository registerRepository;
    @Autowired
    LectureRepository lectureRepository;
    @Autowired
    LectureService lectureService;
    @Autowired
    RegisterService registerService;
    @Autowired
    UserService userService;

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        int lecno = Integer.parseInt(request.getParameter("lecno"));
        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);
        Lecture lecture = lectureService.lectureDetail(lecno);
        model.addAttribute("lecture", lecture);
        model.addAttribute("user",user);
        return "/register/paypage";
    }

    @PostMapping("insertpro.do")
    public String subjectInsert(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        String id = (String) session.getAttribute("sid");
        Register register = new Register();
        register.setLeccode(request.getParameter("leccode"));
        register.setId(request.getParameter("id"));
        registerService.registerInsert(register);


        return "redirect:lecture/home";
    }
}
