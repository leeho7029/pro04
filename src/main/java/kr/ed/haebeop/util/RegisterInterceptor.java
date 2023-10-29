package kr.ed.haebeop.util;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RegisterInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private RegisterService registerService;

    @Autowired
    private LectureService lectureService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");
        String lcode = request.getParameter("lcode");

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        // 1. 로그아웃 상태인 경우
        if (session == null || sid == null) {
            out.print("<script> confirm('로그인 후 수강신청 가능합니다.'); location.href='" + request.getContextPath() + "/user/login'; </script>");
            out.flush();
            return false;
        }

        // 2. 이미 수강신청이 완료된 경우
        if(!registerService.isReg(lcode, sid)) {
            out.print("<script> confirm('이미 수강신청한 강의입니다.'); location.href='" + request.getContextPath() + "/lecture/detail?lcode=" + lcode + "'; </script>");
            out.flush();
            return false;
        }

        // 3. 수강신청 기간이 끝난 경우
        if(lectureService.comparePeriod(lcode)) {
            out.print("<script> confirm('수강신청 기간이 아닙니다.'); location.href='" + request.getContextPath() + "/lecture/detail?lcode=" + lcode + "'; </script>");
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
