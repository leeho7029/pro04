package kr.ed.haebeop.controller;
import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
@Controller
@RequestMapping("/payment/*")
public class PaymentController {
    @Autowired
    private HttpSession session;
    @Autowired
    private UserService userService;
    @Autowired
    private RegisterService registerService;
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private DeliveryService deliveryService;
    @Autowired
    private LectureService lectureService;
    @RequestMapping(value = "payCheck", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> payCheck(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        String lcode = request.getParameter("lcode");
        boolean result = paymentService.payCheck(id, lcode);
        Payment payment = paymentService.PaymentDetail(id, lcode);
        int curApp = paymentService.getCount(lcode);
        if (result) {
            result = true;
        } else {
            // 이미 수강신청한 경우
            if (payment != null && payment.getLcode().equals(lcode)) {
                result = false; // 해당 강의에 대한 신청은 거부
            } else {
                result = true; // 다른 신청에 대한 신청은 허용
            }
        }
        Map<String, Object> response = new HashMap<>();
        response.put("result", result);
        response.put("curApp", curApp);
        return response;
    }
    @GetMapping("payment")
    public String getpaymentForm (@RequestParam String lcode, @RequestParam String bcode, HttpServletRequest request, Model model) throws Exception{
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);
        Lecture lecture = paymentService.getLecture(lcode);
        Book book = paymentService.getBook(bcode);
        model.addAttribute("user", user);
        model.addAttribute("lecture", lecture);
        model.addAttribute("book", book);
        return "/lecture/lecturePayment";
    }
    @PostMapping("paymentPro")
    public String paymentPro(HttpServletRequest request, RedirectAttributes rttr, HttpSession session) throws Exception {
        String lcode = request.getParameter("lcode");
        String bcode = request.getParameter("bcode");
        String id = (String) session.getAttribute("sid");
        int pt = 0;
        String ptpt = request.getParameter("pt");
        if (ptpt != null && !ptpt.isEmpty()) {
            pt = Integer.parseInt(ptpt);
        }
        Payment payment = new Payment();
        payment.setLcode(lcode);
        payment.setTitle(request.getParameter("title"));
        payment.setBcode(bcode);
        payment.setId(id);
        payment.setTcode(request.getParameter("tcode"));
        payment.setMethod(request.getParameter("method"));
        payment.setCom(request.getParameter("com"));
        payment.setPrice(Integer.parseInt(request.getParameter("price")));
        payment.setAccount(request.getParameter("account"));
        int pno = paymentService.paymentInsert(id, lcode, payment);
        if(pno > 0) {
            Delivery delivery = new Delivery();
            delivery.setPno(pno);
            delivery.setId(id);
            delivery.setAddr(request.getParameter("addr1") + "<br>" + request.getParameter("addr2") + "<br>" + request.getParameter("postcode"));
            delivery.setTel(request.getParameter("tel"));
            Serve serve = new Serve();
            serve.setPno(pno);
            serve.setBcode(bcode);
            serve.setSprice(request.getParameter("sprice"));
            serve.setAmount(request.getParameter("amount"));
            paymentService.addPayment(delivery, serve, pt, id);
            return "redirect:/user/payment";
        } else {
            rttr.addFlashAttribute("msg", "수강신청이 마감되었습니다.");
            return "redirect:/lecture/list";
        }
    }
    @GetMapping("payDetail")
    public String getPayment(HttpServletRequest request, Model model) throws Exception{
        int pno = Integer.parseInt(request.getParameter("pno"));
        PaymentVO payment = paymentService.myPaymentDetail(pno);
        model.addAttribute("payment", payment);
        return "/user/userPayDetail";
    }
    @GetMapping("deliveryDetail")
    public String getDelivery(HttpServletRequest request, Model model) throws Exception{
        int dno = Integer.parseInt(request.getParameter("dno"));
        DeliveryVO delivery = deliveryService.myDeliveryDetail(dno);
        model.addAttribute("delivery", delivery);
        return "/user/userDeliveryDetail";
    }
    @GetMapping("paymentDelete")
    @ResponseBody
    public ResponseEntity<String> getPaymentDelete(@RequestParam String lcode, @RequestParam int pno, HttpSession session, Model model) {
        String id = (String) session.getAttribute("sid");
        try {
            paymentService.deletePayment(lcode, id, pno);
            return new ResponseEntity<>("구매취소 성공", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("구매취소 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("paymentNoBook")
    public String paymentNoBook (Payment payment,HttpServletRequest request, Model model) throws Exception{
        paymentService.paymentNoBookInsert(payment);
        return "redirect:/user/payment";
    }
}