package kr.co.haebop.controller;

import kr.co.haebop.domain.Book;
import kr.co.haebop.domain.FileInfo2;
import kr.co.haebop.domain.FileInfo3;
import kr.co.haebop.domain.Fileboard;


import kr.co.haebop.service.BookService;
import kr.co.haebop.service.CommentService;
import kr.co.haebop.service.CommunityService;
import kr.co.haebop.service.FileboardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/book/")
public class BookController {
    @Autowired
    private CommunityService communityService;

    @Autowired
    private CommentService commentService;
    @Autowired
    private BookService bookService;
    @Autowired
    HttpSession session;
    @Autowired
    private FileboardService fileboardService;
    @RequestMapping("home")
    public String home(Locale locale, Model model) throws Exception {
        List<Book> bookList = bookService.bookList();
        model.addAttribute("bookList",bookList);

        return "/book/bookList";
    }
    @GetMapping("detail.do")
    public String getbookDetail(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Book book = bookService.bookDetail(no);
        model.addAttribute("book",book);
        return "/book/bookDetail";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception{
        return "/book/bookInsert";
    }

    @PostMapping("insertpro.do")
    public String bookInsert(ServletRequest request, Model model, @RequestParam("upfile") MultipartFile[] files, HttpServletRequest req) throws Exception{
        Book book = new Book();
        FileInfo3 fileInfo3 = new FileInfo3();
        String id = (String) session.getAttribute("sid");
        if (id != null && id.equals("admin")) { //관리자만 등록가능
            //String realPath = req.getRealPath("/pro3_war/resources/upload");
            String realPath = req.getSession().getServletContext().getRealPath("/resources/upload/book/"); // 경로설정
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
            book.setFileInfos(fileInfos);
            book.setAuthor(request.getParameter("author"));
            book.setMemo(request.getParameter("memo"));
            book.setBindex(request.getParameter("bindex"));
            book.setPrice(request.getParameter("price"));
            book.setPubdate(request.getParameter("pubdate"));
            book.setBktitle(request.getParameter("bktitle"));
            try {
                bookService.bookInsert(book);
                List<Book> bookList = bookService.bookList();
                model.addAttribute("bookList", bookList);
                return "/book/bookList";
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


    @GetMapping("delete.do")
    public String bookDelete(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        bookService.bookDelete(no);
        return "redirect:list.do";
    }
}
