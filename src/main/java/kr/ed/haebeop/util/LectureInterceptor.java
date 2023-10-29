package kr.ed.haebeop.util;

import kr.ed.haebeop.service.CurriculumService;
import kr.ed.haebeop.service.RegisterService;
import kr.ed.haebeop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Date;

public class LectureInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private RegisterService registerService;

    @Autowired
    private CurriculumService curriculumService;

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        // 1. 로그인한 사람만 접근 가능하도록 처리
        if(sid == null) {
            out.print("<script> confirm('로그인 후 접근 가능한 페이지입니다.'); location.href='" + request.getContextPath() + "/user/login'; </script>");
            out.flush();
            return false;
        }

        // 2. 수강신청한 사람만 강의를 들을 수 있도록 처리
        int ccode = Integer.parseInt(request.getParameter("ccode"));
        String lcode = curriculumService.findLcode(ccode);
        if(registerService.isReg(lcode, sid)) {
            out.print("<script> confirm('수강신청 후에 강의를 들을 수 있습니다.'); window.close(); </script>");
            out.flush();
            return false;
        }

        // 3. 시작일과 종료일 사이에만 강의를 들을 수 있도록 처리
        if(registerService.isPeriod(lcode) == 0) {
            out.print("<script> confirm('강의 수강 기간이 아닙니다.'); window.close(); </script>");
            out.flush();
            return false;
        }
        
        // 4. 다른 기기에서 스트리밍 중이라면 강의를 들을 수 없도록 처리
        if(userService.getIsStudy(sid)) {
            out.print("<script> confirm('다른 브라우저 혹은 다른 기기에서 스트리밍 중입니다.'); window.close(); </script>");
            out.flush();
            return false;
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
}
