package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Test;
import kr.ed.haebeop.service.TestService;
import kr.ed.haebeop.service.TestServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/test/")
public class TestController {

    @Autowired
    private TestService testService;

    @GetMapping("list")
    public String testList(Model model) throws Exception {
        List<Test> testList = testService.testList();
        model.addAttribute("testList", testList);
        return "/test/testList";
    }

    @GetMapping("list2")
    public String testList2(Model model) throws Exception {
        List<Test> testList = testService.testList2();
        model.addAttribute("testList", testList);
        return "/test/testList";
    }

    @GetMapping("list3")
    public String testList3(Model model) throws Exception {
        List<Test> testList = testService.testList3();
        model.addAttribute("testList", testList);
        return "/test/testList";
    }

}
