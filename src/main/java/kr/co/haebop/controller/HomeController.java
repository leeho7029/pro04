package kr.co.haebop.controller;

import kr.co.haebop.domain.Notice;
import kr.co.haebop.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Locale;

@Controller
public class HomeController {
    //http:localhost:8081/pro03_war => / => /WEB-INF/views/index.jsp

    @Autowired
    private NoticeService noticeService;

//    @Autowired
//    private FileboardService fileboardService;
//    @Autowired
//    private FileInfoService fileInfoService;

    @RequestMapping("/")
    public String home(Locale locale, Model model) throws Exception {
//        List<Notice> noticeList = noticeService.noticeListLimit();
//        model.addAttribute("noticeList", noticeList);

//        List<Fileboard> fileboardList = fileboardService.fileList();
//        model.addAttribute("fileboardList", fileboardList);

        return "/index";
    }
}
