package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.DataRoom;
import kr.ed.haebeop.domain.FileInfo;
import kr.ed.haebeop.service.DataRoomService;
import kr.ed.haebeop.service.FileInfoService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/dataRoom/*")
public class DataRoomController {

    @Autowired
    private DataRoomService dataRoomService;

    @Autowired
    private FileInfoService fileInfoService;

    @Autowired
    private HttpSession session;

    @GetMapping("list")
    public String getBoardList(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setKeyword(request.getParameter("keyword"));
        page.setType(request.getParameter("type"));

        // 페이징에 필요한 데이터 만들기
        int total = dataRoomService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<DataRoom> dataRoomList = dataRoomService.dataRoomList(page);
        model.addAttribute("dataRoomList", dataRoomList);           // 자료 목록
        model.addAttribute("curPage", curPage);                     // 현재 페이지
        model.addAttribute("page", page);                           // 페이징 데이터
        return "/dataRoom/dataRoomList";
    }

    @RequestMapping(value = "insert", method = RequestMethod.GET)
    public String insertForm() throws Exception {
        return "/dataRoom/dataRoomInsert";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String write(DataRoom dataRoom, @RequestParam("upfile") MultipartFile[] files, HttpServletRequest req, Model model, RedirectAttributes rttr) throws Exception {
        String sid = (String) session.getAttribute("sid");
        if(sid != null && sid.equals("admin")) {
            String realPath = req.getRealPath("/resources/upload/dataRoom/");           // 업로드 경로 설정
            String today = new SimpleDateFormat("yyMMdd").format(new Date());
            String saveFolder = realPath + today;
            File folder = new File(saveFolder);
            if(!folder.exists()) {                                  // 폴더가 존재하지 않으면 폴더 생성
                folder.mkdirs();
            }
            List<FileInfo> fileInfoList = new ArrayList<>();        // 첨부파일 정보를 리스트로 생성
            for(MultipartFile file : files) {
                FileInfo fileInfo = new FileInfo();
                String originalFileName = file.getOriginalFilename(); // 첨부파일의 실제 파일명
                if(!originalFileName.isEmpty()) {
                    String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf("."));     // 파일 이름을 랜덤으로 설정
                    fileInfo.setSaveFolder(today);
                    fileInfo.setOriginFile(originalFileName);
                    fileInfo.setSaveFile(saveFileName);
                    file.transferTo(new File(folder, saveFileName));    // 파일을 업로드 폴더에 저장
                }
                fileInfoList.add(fileInfo);
            }
            dataRoom.setFileInfoList(fileInfoList);
            dataRoom.setId(sid);

            try {
                dataRoomService.dataRoomInsert(dataRoom);
                rttr.addFlashAttribute("msg", "자료실에 글을 등록하였습니다");
            } catch(Exception e) {
                e.printStackTrace();
                rttr.addFlashAttribute("msg", "글 작성 중 문제가 발생했습니다");
            }
        } else {
            rttr.addFlashAttribute("msg", "관리자만 접근 가능한 페이지입니다");
        }
        return "redirect:/dataRoom/list";
    }

    @GetMapping("detail")
    public String detail(HttpServletRequest request, Model model) throws Exception {
        int articleNo = request.getParameter("articleNo") != null ? Integer.parseInt(request.getParameter("articleNo")) : 0;
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        DataRoom dataRoom = dataRoomService.dataRoomDetail(articleNo);
        DataRoom prev = dataRoomService.dataRoomRef(articleNo, "prev");
        DataRoom next = dataRoomService.dataRoomRef(articleNo, "next");
        List<FileInfo> fileList = fileInfoService.fileInfoList(articleNo);

        model.addAttribute("detail", dataRoom);
        model.addAttribute("prev", prev);
        model.addAttribute("next", next);
        model.addAttribute("fileList", fileList);
        model.addAttribute("curPage", curPage);

        return "/dataRoom/dataRoomDetail";
    }

    @GetMapping("edit")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int articleNo = request.getParameter("articleNo") != null ? Integer.parseInt(request.getParameter("articleNo")) : 0;
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        DataRoom dataRoom = dataRoomService.dataRoomDetail(articleNo);
        dataRoom.setFileInfoList(fileInfoService.fileInfoList(articleNo));

        model.addAttribute("dataRoom", dataRoom);
        model.addAttribute("curPage", curPage);

        return "/dataRoom/dataRoomEdit";
    }

    @PostMapping("edit")
    public String dataRoomEdit(DataRoom dataRoom, @RequestParam("upfile") MultipartFile[] files, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
        String sid = (String) session.getAttribute("sid");
        if (sid != null && sid.equals("admin")) {
            String realPath = request.getSession().getServletContext().getRealPath("/resources/upload/dataRoom/"); // 경로설정
            String today = new SimpleDateFormat("yyMMdd").format(new Date());                               //오늘 날짜
            String saveFolder = realPath + today;           // 저장되는 폴더 경로
            File folder = new File(saveFolder);
            if(!folder.exists()) {                          // 폴더가 존재하지 않으면 생성함
                folder.mkdirs();
            }

            // 파일이 새롭게 업로드되지 않았다면 삭제하지 않도록 처리
            if(files[0].getSize() != 0) {
                List<FileInfo> fileList = fileInfoService.fileInfoList(dataRoom.getArticleNo());
                ServletContext application = request.getSession().getServletContext();
                for (FileInfo fileInfo : fileList) {
                    File oldFile = new File(application.getRealPath("/") + "/resources/upload/" + fileInfo.getSaveFolder() + "/" + fileInfo.getSaveFile());
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }
            }

            List<FileInfo> fileInfos = new ArrayList<>();   //첨부파일 정보를 리스트로 생성
            for (MultipartFile file : files) {
                FileInfo fileInfo = new FileInfo();
                String originalFileName = file.getOriginalFilename(); //첨부파일의 실제 파일명을 저장
                if (!originalFileName.isEmpty()) {
                    String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf('.')); // 랜덤으로 파일이름 설정
                    fileInfo.setArticleNo(dataRoom.getArticleNo());
                    fileInfo.setSaveFolder(today);
                    fileInfo.setOriginFile(originalFileName);
                    fileInfo.setSaveFile(saveFileName);
                    file.transferTo(new File(folder, saveFileName));  // 파일을 업로드 폴더에 저장
                }
                fileInfos.add(fileInfo);
            }

            dataRoom.setFileInfoList(fileInfos);
            dataRoom.setId(sid);

            try {
                dataRoomService.dataRoomEdit(dataRoom);
            } catch (Exception e) {
                e.printStackTrace();
                rttr.addFlashAttribute("msg", "글 작성중 문제가 발생했습니다");
            }

        } else {
            rttr.addFlashAttribute("msg", "관리자만 접근 가능한 페이지입니다");
        }

        rttr.addAttribute("articleNo", dataRoom.getArticleNo());
        rttr.addAttribute("page", request.getParameter("page"));
        return "redirect:/dataRoom/detail";
    }

    @GetMapping("delete")
    public String dataRoomDelete(@RequestParam int articleNo, RedirectAttributes rttr) throws Exception {
        dataRoomService.dataRoomDelete(articleNo);
        return "redirect:/dataRoom/list";
    }

}
