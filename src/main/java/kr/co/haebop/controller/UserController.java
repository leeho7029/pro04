package kr.co.haebop.controller;

import kr.co.haebop.domain.User;
import kr.co.haebop.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/user/*")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    HttpSession session;

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @RequestMapping("term.do")
    public String term(Model model) {
        System.out.println("확인11"); return "/user/term";
    }

    @RequestMapping(value = "join.do")
    public String join(Model model) {return "/user/join";}

    @RequestMapping(value = "join.do", method = RequestMethod.POST)
    public String joinPro(ServletRequest request, ServletResponse response, Model model) throws Exception{
        User user = new User();
        String ppw = request.getParameter("pw");
        String pw = pwEncoder.encode(ppw);
        user.setId(request.getParameter("id"));
        user.setPw(pw);
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setTel("tel");
        user.setAddr1(request.getParameter("addr1"));
        user.setAddr2(request.getParameter("addr2"));
        user.setPostcode(request.getParameter("postcode"));
        user.setBirth(request.getParameter("birth"));
        userService.UserInsert(user);

        return "/user/login";
    }

    @RequestMapping(value = "idCheck.do", method = RequestMethod.POST)
    public void idCheck(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        System.out.println("확인1");
        String id = request.getParameter("id");
        boolean result = userService.idCheck(id);
        System.out.println("확인2");
        JSONObject json = new JSONObject();
        json.put("result",result);
        System.out.println("확인3");
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }

    @RequestMapping("login.do")
    public String userLoginForm(Model model) throws Exception {
        return "/user/login";
    }

    @RequestMapping("login2.do")
    public String userLoginForm2(Model model) throws Exception {
        return "/user/loginmypage";
    }
    @RequestMapping(value = "loginpro.do", method = RequestMethod.POST)
    public String userLogin(@RequestParam String id, @RequestParam String pw, HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        boolean ps = userService.loginCheck(id, pw);
        String saveId = request.getParameter("saveId");

        Cookie cookie = new Cookie("userID", id);

        if (ps && saveId != null) {
            response.addCookie(cookie);
        } else if (ps && saveId == null) {
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }

        if(ps){
            session.setAttribute("sid",id);
            userService.updateVisited(id);
            return "redirect:/";
        }else {
            return "redirect:login.do";
        }
    }

    @RequestMapping(value = "loginpro2.do", method = RequestMethod.POST)
    public String userLogin2(HttpSession session, @RequestParam String pw, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        boolean ps = userService.loginCheck(id, pw);
        if(ps){
            session.setAttribute("sid", id);
            return "redirect:mypage.do";
        } else {
            return "redirect:login2.do";
        }
    }

    @GetMapping("logout.do")
    public String userLogout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("myInfo.do")
    public String mtInfo(Model model) throws Exception{
        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);
        model.addAttribute("user",user);
        return "/user/myinfo";
    }
    @GetMapping("mypage.do")
    public String mypage(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);
        model.addAttribute("user", user);
        return "/user/mypage";
    }

    @RequestMapping(value="update.do", method=RequestMethod.POST)
    public String UserUpdate(User user, Model model) throws Exception {
        String pwd = "";
        if(user.getPw().length()<=16) {
            pwd = pwEncoder.encode(user.getPw());
            user.setPw(pwd);
        }
        userService.UserEdit(user);
        return "redirect:/";
    }

    @RequestMapping(value="delete.do", method = RequestMethod.GET)
    public String userDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        userService.UserDelete(id);
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value="list.do", method = RequestMethod.GET)
    public String userList(Model model) throws Exception {
        List<User> userList = userService.UserList();
        model.addAttribute("userList", userList);

        return "/user/userList";
    }
}
