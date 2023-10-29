package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.service.CommentService;
import kr.ed.haebeop.util.BadWordFiltering;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/comment/*")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping(value="insert", method= RequestMethod.POST)
    public ModelAndView commentInsert(Comment comment, HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {
        String word = comment.getContent();
        BadWordFiltering filter = new BadWordFiltering();
        Boolean pass = filter.check(word);
        String msg = "";
        if(pass) {
            msg = filter.messagePrint(word);
            rttr.addFlashAttribute("msg", msg);
        }  else {
            HttpSession session = request.getSession();
            comment.setNickname((String) session.getAttribute("sid"));
            commentService.commentInsert(comment);
        }
        rttr.addAttribute("seq", request.getParameter("seq"));
        rttr.addAttribute("page", request.getParameter("page"));
        // 다른 컨트롤러의 페이지로 redirect하기
        ModelAndView mav = new ModelAndView();
        mav.setView(new RedirectView(request.getContextPath() + "/board/detail"));
        return mav;
    }

    @GetMapping("delete")
    public String commentDelete(HttpServletRequest request, Model model) throws Exception {
        int comNo = Integer.parseInt(request.getParameter("comNo"));
        commentService.commentDelete(comNo);

        model.addAttribute("seq", request.getParameter("seq"));
        model.addAttribute("page", request.getParameter("page"));

        return "redirect:/board/detail";
    }

}
