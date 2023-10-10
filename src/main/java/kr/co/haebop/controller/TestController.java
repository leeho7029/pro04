package kr.co.haebop.controller;

import kr.co.haebop.domain.Test;
import kr.co.haebop.service.TestService;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/test/")
public class TestController {
    @Autowired
    private TestService testService;

    @GetMapping("testList")
    public String getTestList(Model model) throws Exception{
        List<Test> testList = testService.testList();
        model.addAttribute("testList", testList);
        return "/test/testList";
    }
}
