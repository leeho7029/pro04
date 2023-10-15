package kr.co.haebop.controller;

import kr.co.haebop.domain.*;
import kr.co.haebop.service.FileInfo2Service;
import kr.co.haebop.service.FileInfoService;
import kr.co.haebop.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/teacher/*")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
    HttpSession session;
    @Autowired
    private FileInfo2Service fileInfo2Service;
    @Autowired
    private FileInfoService fileInfoService;

    @RequestMapping(value = "insert.do")
    public String join(Model model) {
        return "/teacher/teacherInsert";
    }

    @RequestMapping(value = "insertpro.do", method = RequestMethod.POST)
    public String joinPro(ServletRequest request, ServletResponse response, Model model, @RequestParam("upfile") MultipartFile[] files, HttpServletRequest req) throws Exception {
        Teacher teacher = new Teacher();
        FileInfo2 fileInfo2 = new FileInfo2();
        String id = (String) session.getAttribute("sid");
        if (id != null && id.equals("admin")) { //관리자만 등록가능
            //String realPath = req.getRealPath("/pro3_war/resources/upload");
            String realPath = req.getSession().getServletContext().getRealPath("/resources/upload/teacher/"); // 경로설정
            System.out.println("path : " + realPath);
            String today = new SimpleDateFormat("yyMMdd").format(new Date()); //오늘 날짜
            String saveFolder = realPath + today; // 저장되는 폴더 경로
            System.out.println(saveFolder);
            File folder = new File(saveFolder);
            if (!folder.exists()) // 폴더가 존재하지 않으면 생성함
                folder.mkdirs();
            List<FileInfo2> fileInfos = new ArrayList<>(); //첨부파일 정보를 리스트로 생성
            for (MultipartFile mfile : files) {
                FileInfo2 fileInfo2Dto = new FileInfo2();
                String originalFileName = mfile.getOriginalFilename(); //첨부파일의 실제 파일명을 저장
                if (!originalFileName.isEmpty()) {
                    String saveFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf('.')); // 랜덤으로 파일이름 설정
                    fileInfo2Dto.setSaveFolder(today); // 파일인포 객체에 값저장
                    fileInfo2Dto.setOriginFile(originalFileName); // 파일인포 객체에 값저장
                    fileInfo2Dto.setSaveFile(saveFileName); // 파일인포 객체에 값저장
                    System.out.println(mfile.getOriginalFilename() + "   " + saveFileName);
                    mfile.transferTo(new File(folder, saveFileName)); // 파일을 업로드 폴더에 저장
                }
                fileInfos.add(fileInfo2Dto);
            }
            teacher.setFileInfos(fileInfos);
            teacher.setTname(request.getParameter("tname"));
            teacher.setTtel(request.getParameter("ttel"));
            teacher.setTmail(request.getParameter("tmail"));
            try {
                teacherService.teacherInsert(teacher);
                List<Teacher> teacherList = teacherService.teacherList();
                model.addAttribute("teacherList", teacherList);
                return "/admin/adminTeacher";
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

    @GetMapping("detail.do")    //board/detail.do?seq=1
    public String getteacherDetail(HttpServletRequest request, Model model) throws Exception {
        int seq = Integer.parseInt(request.getParameter("seq"));
        Teacher teacher = teacherService.teacherDetail(seq); //해당 자료실 객체 값 생성
        List<FileInfo2> fileboard2 = fileInfo2Service.fileInfoDetail(seq); //해당 자료실에 첨부된 파일 객체 값 생성
        System.out.println("파일첨부되어있나?"+fileboard2);
        System.out.println("선생님정보"+teacher);
        model.addAttribute("teacher", teacher);
        model.addAttribute("fileboard2", fileboard2);
        return "/teacher/teacherDetail";
    }

    @GetMapping("delete.do")
    public String teacherDelete(HttpServletRequest request, Model model) throws Exception{
        int seq = Integer.parseInt(request.getParameter("seq"));
        teacherService.teacherDelete(seq);
        return "redirect:/admin/home";
    }
}
