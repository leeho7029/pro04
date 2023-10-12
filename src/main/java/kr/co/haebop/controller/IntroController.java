package kr.co.haebop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Locale;

@Controller
@RequestMapping("/intro/*")
public class IntroController {
    @GetMapping("list.do")
    public String intro(Locale locale, Model model) throws Exception {

        return "/intro/intro";
    }
}
