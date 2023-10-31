package kr.ed.haebeop.controller;

import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@PropertySource("classpath:application-API-KEY.properties")     // application-API-KEY.properties에 저장된 키 값 가져오기
public class HomeController {

    @Autowired
    private LectureService lectureService;
    @Autowired
    private RegisterService registerService;



    @Value("${Naver-Map-API-KEY}")
    private String naverMapKey;

    @RequestMapping("/")
    public String index(HttpServletRequest request, Model model) throws Exception {
        // 인기 강의 목록

        return "/index";
    }

}
