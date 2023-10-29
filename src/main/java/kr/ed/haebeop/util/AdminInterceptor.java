package kr.ed.haebeop.util;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();            // 로그인 유무를 판단하는 것이 아니기 때문에 false는 사용하지 않음
        String sid = (String) session.getAttribute("sid");

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        if(session.getAttribute("sid") == null) {                                       // 로그인하지 않은 경우
            out.print("<script> confirm('관리자만 접근 가능한 페이지입니다.'); location.href='" + request.getContextPath() + "/user/login'; </script>");
            out.flush();
            return false;
        }
        if(sid.equals("admin")) {
            return true;
        } else {
            out.print("<script> confirm('관리자만 접근 가능한 페이지입니다.'); location.href='" + request.getContextPath() + "/'; </script>");
            out.flush();
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // 그냥 기본값으로 둔 것
        super.postHandle(request, response, handler, modelAndView);
    }
}