package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Qna;
import kr.ed.haebeop.service.QnaService;
import kr.ed.haebeop.util.BadWordFiltering;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

    @Autowired
    private QnaService qnaService;

    //QnA 목록
    @GetMapping("list")
    public String getQnaList(HttpServletRequest request, Model model) throws Exception {
        //Page
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setKeyword(request.getParameter("keyword"));   //검색 키워드 set
        page.setType(request.getParameter("type"));         //검색 타입 set

        //페이징에 필요한 데이터 저장
        int total = qnaService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Qna> qnaList = qnaService.qnaList(page);
        model.addAttribute("qnaList", qnaList);     //QnA 목록
        model.addAttribute("curPage", curPage);     // 현재 페이지
        model.addAttribute("page", page);           // 페이징 데이터

        return "/qna/qnaList";
    }

    //QnA 상세보기
    @GetMapping("detail")
    public String getQnaDetail(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        Qna detail = qnaService.qnaDetail(qno);
        model.addAttribute("detail", detail);

        Qna prev = qnaService.qnaRef(qno, "prev");
        Qna next = qnaService.qnaRef(qno, "next");
        model.addAttribute("prev", prev);
        model.addAttribute("next", next);
        model.addAttribute("curPage", request.getParameter("page"));
        return "/qna/qnaDetail";
    }

    //Question 글 쓰기
    @GetMapping("questionInsert")
    public String getQuestionInsert(Model model) throws Exception {
        return "/qna/questionInsert";
    }

    //Question 글쓰기 처리
    @PostMapping("questionInsert")
    public String getQuestionInsertPro(Qna qna, RedirectAttributes rttr, HttpServletRequest request, Model model) throws Exception {
        String word = qna.getContent();
        String word2 = qna.getTitle();
        BadWordFiltering filter = new BadWordFiltering();
        Boolean pass = filter.check(word);
        Boolean pass2 = filter.check(word2);
        String msg = "";
        if(pass) {
            msg = filter.messagePrint(word);
            rttr.addFlashAttribute("msg", msg);
            return "redirect:" + request.getHeader("Referer");
        } else if(pass2){
            msg = filter.messagePrint(word2);
            rttr.addFlashAttribute("msg", msg);
            return "redirect:" + request.getHeader("Referer");
        } else {
            HttpSession session = request.getSession();
            Qna dto = new Qna();
            dto.setTitle(request.getParameter("title"));
            dto.setContent(request.getParameter("content"));
            dto.setAuthor((String) session.getAttribute("sid"));
            qnaService.questionInsert(dto);
            return "redirect:list";
        }
    }

    //Question 수정
    @GetMapping("edit")
    public String getQnaEdit(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        Qna detail = qnaService.qnaDetail(qno);
        model.addAttribute("detail", detail);
        return "/qna/qnaEdit";
    }
    //Question 수정처리
    @PostMapping("edit")
    public String getQnaEditPro(Qna qna, RedirectAttributes rttr, HttpServletRequest request, Model model) throws Exception {
        String word = qna.getContent();
        String word2 = qna.getTitle();
        BadWordFiltering filter = new BadWordFiltering();
        Boolean pass = filter.check(word);
        Boolean pass2 = filter.check(word2);
        String msg = "";
        if(pass) {
            msg = filter.messagePrint(word);
            rttr.addFlashAttribute("msg", msg);
            return "redirect:" + request.getHeader("Referer");
        } else if(pass2){
            msg = filter.messagePrint(word2);
            rttr.addFlashAttribute("msg", msg);
            return "redirect:" + request.getHeader("Referer");
        } else {
            int qno = Integer.parseInt(request.getParameter("qno"));
            Qna dto = new Qna();
            dto.setQno(qno);
            dto.setTitle(request.getParameter("title"));
            dto.setContent(request.getParameter("content"));
            qnaService.qnaEdit(dto);
            return "redirect:detail?qno=" + qno + "&page=1";
        }
    }

    //QnA 삭제
    @GetMapping("delete")
    public String getQnaDelete(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        qnaService.qnaDelete(qno);
        return "redirect:list";
    }

    //답변 등록
    @GetMapping("answerInsert")
    public String getAnswerInsert(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        Qna detail = qnaService.qnaDetail(qno);
        model.addAttribute("detail", detail);
        return "/qna/answerInsert";
    }

    //답변 등록 처리
    @PostMapping("answerInsert")
    public String getAnswerInsertPro(Qna qna, HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        qna.setAuthor((String) session.getAttribute("sid"));
        qnaService.answerInsert(qna);
        return "redirect:list";
    }
}
