package kr.co.haebop.controller;

import kr.co.haebop.domain.*;
import kr.co.haebop.service.*;
import kr.co.haebop.util.CommunityPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/lecture/*")
public class LectureController {
    @Autowired
    private CommunityService communityService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private LecBoardKorService lecBoardKorService;
    @Autowired
    HttpSession session;
    @Autowired
    private FileboardService fileboardService;
    @Autowired
    private LectureService lectureService;
    @Autowired
    private BookService bookService;
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private FileInfo3Service fileInfo3Service;
    @RequestMapping("home")
    public String home(Locale locale, Model model) throws Exception {
        List<Lecture> lecturesList = lectureService.lectureList();
        model.addAttribute("lecturesList",lecturesList);
        return "/lecture/main";
    }

    @RequestMapping("korean")
    public String korean(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        List<Lecture> lectureList = lectureService.lectureList();
        List<LecBoardKor> lecBoardKorList = lecBoardKorService.LecBoardKorList();
        System.out.println(lecBoardKorList);
        model.addAttribute("lecBoardKor",lecBoardKorList);
        model.addAttribute("lectureList",lectureList);
        return "/lecture/korean";
    }

    @RequestMapping("english")
    public String english(Locale locale, Model model) throws Exception {
        return "/lecture/english";
    }

    @RequestMapping("math")
    public String math(Locale locale, Model model) throws Exception {
        return "/lecture/math";
    }
    @RequestMapping("detail.do")
    public String detail(HttpServletRequest request,Locale locale, Model model) throws Exception {
        int lecno = Integer.parseInt(request.getParameter("lecno"));
        Lecture lecture = lectureService.lectureDetail(lecno);
        List<FileInfo3> fileboard = fileInfo3Service.fileInfoDetail(lecno);
        List<LecBoardKor> lecBoardKorList = lecBoardKorService.LecBoardKorList();
        System.out.println(fileboard);
        System.out.println(lecBoardKorList);
        model.addAttribute("lecture", lecture);
        model.addAttribute("fileboard",fileboard);
        model.addAttribute("lecBoardKorList",lecBoardKorList);
        return "/lecture/koreanDetail";
    }

    @RequestMapping(value = "insert.do")
    public String join(Model model) {
        return "/admin/adminLectureInsert";
    }

    @RequestMapping(value = "insertpro.do", method = RequestMethod.POST)
    public String joinPro(ServletRequest request, ServletResponse response, Model model, @RequestParam("upfile") MultipartFile[] files, HttpServletRequest req) throws Exception {
        Lecture lecture = new Lecture();
        FileInfo3 fileInfo3 = new FileInfo3();
        String id = (String) session.getAttribute("sid");
        List<Subject> subject = subjectService.subjectList();
        List<Book> book = bookService.bookList();
        model.addAttribute("book",book);
        model.addAttribute("subject",subject);
        if (id != null && id.equals("admin")) { //관리자만 등록가능
            //String realPath = req.getRealPath("/pro3_war/resources/upload");
            String realPath = req.getSession().getServletContext().getRealPath("/resources/upload/lecture/"); // 경로설정
            System.out.println("path : " + realPath);
            String today = new SimpleDateFormat("yyMMdd").format(new Date()); //오늘 날짜
            String saveFolder = realPath + today; // 저장되는 폴더 경로
            System.out.println(saveFolder);
            File folder = new File(saveFolder);
            if (!folder.exists()) // 폴더가 존재하지 않으면 생성함
                folder.mkdirs();
            List<FileInfo3> fileInfos = new ArrayList<>(); //첨부파일 정보를 리스트로 생성
            for (MultipartFile mfile : files) {
                FileInfo3 fileInfo3Dto = new FileInfo3();
                String originalFileName = mfile.getOriginalFilename(); //첨부파일의 실제 파일명을 저장
                if (!originalFileName.isEmpty()) {
                    String saveFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf('.')); // 랜덤으로 파일이름 설정
                    fileInfo3Dto.setSaveFolder(today); // 파일인포 객체에 값저장
                    fileInfo3Dto.setOriginFile(originalFileName); // 파일인포 객체에 값저장
                    fileInfo3Dto.setSaveFile(saveFileName); // 파일인포 객체에 값저장
                    System.out.println(mfile.getOriginalFilename() + "   " + saveFileName);
                    mfile.transferTo(new File(folder, saveFileName)); // 파일을 업로드 폴더에 저장
                }
                fileInfos.add(fileInfo3Dto);
            }
            lecture.setFileInfos(fileInfos);
            lecture.setBkcode(request.getParameter("bkcode"));
            lecture.setCate(request.getParameter("cate"));
            lecture.setStno(request.getParameter("stno"));
            lecture.setLectitle(req.getParameter("lectitle"));
            lecture.setSubcode(req.getParameter("subcode"));
            lecture.setBkcode(req.getParameter("bkcode"));
            lecture.setStno(req.getParameter("stno"));
            try {
                lectureService.lectureInsert(lecture);
                List<Lecture> lectureList = lectureService.lectureList();

                model.addAttribute("lectureList", lectureList);
                return "/admin/adminLecture";
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("msg", "글 작성중 문제가 발생했습니다.");
                return "/error/error1";
            }
        } else {
            model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
            return "/error/error2";
        }
    }
}
