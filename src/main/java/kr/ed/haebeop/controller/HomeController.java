package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.ReviewVO;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.RegisterService;
import kr.ed.haebeop.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@PropertySource("classpath:application-API-KEY.properties")     // application-API-KEY.properties에 저장된 키 값 가져오기
public class HomeController {

    @Autowired
    private LectureService lectureService;
    @Autowired
    private RegisterService registerService;
    @Autowired
    private ReviewService reviewService;


    @Value("${Naver-Map-API-KEY}")
    private String naverMapKey;

    @RequestMapping("/")
    public String index(HttpServletRequest request, Model model) throws Exception {
        // 인기 강의 목록
        List<LectureVO> popularLectures = lectureService.popularLectureList();
        model.addAttribute("popularLectures", popularLectures);

        // 오프라인 강의 목록(랜덤으로 가져옴)
        List<LectureVO> offLectures = lectureService.stateLectureList("off");
        model.addAttribute("offLectures", offLectures);

        // 온라인 강의 목록(랜덤으로 가져옴)
        List<LectureVO> onLectures = lectureService.stateLectureList("on");
        model.addAttribute("onLectures", onLectures);
        
        // 리뷰 목록
        List<ReviewVO> reviews = reviewService.randomReview();
        model.addAttribute("reviews", reviews);

        // 투두리스트 목록
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");



        // 수강신청한 강의 중 현재 수강기간인 강의 목록
        List<LectureVO> myLectureList = registerService.ongoingMyLecture(id);
        model.addAttribute("myLectureList", myLectureList);

        // Naver Map API Key
        model.addAttribute("naverMapKey", naverMapKey);

        return "/index";
    }

}
