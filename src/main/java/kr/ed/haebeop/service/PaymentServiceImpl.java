package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.persistence.PaymentMapper;
import kr.ed.haebeop.persistence.RegisterMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PaymentServiceImpl implements PaymentService{

    @Autowired
    private RegisterMapper registerMapper;

    @Autowired
    private PaymentMapper paymentMapper;

    @Override
    public boolean already(String lcode, String id) throws Exception {
        Map<String, String> data = new HashMap<>();
        data.put("lcode", lcode);
        data.put("id", id);
        return paymentMapper.already(data);
    }


    @Override
    public Payment PaymentDetail(String id, String lcode) throws Exception {
        Map<String, Object> payment = new HashMap<>();
        payment.put("id", id);
        payment.put("lcode", lcode);
        return paymentMapper.paymentDetail(payment);
    }

    @Override
    public boolean payCheck(String id, String lcode) throws Exception {
        Map<String, Object> payment = new HashMap<>();
        payment.put("id", id);
        payment.put("lcode", lcode);

        Payment pay = paymentMapper.paymentDetail(payment);

        if (pay!= null && pay.getLcode() == lcode) {
            return false;
        }

        return true;
    }

    @Override
    public int getCount(String lcode) throws Exception {
        return paymentMapper.getCount(lcode);
    }

    @Override
    public Lecture getLecture(String lcode) throws Exception {
        return paymentMapper.lectureDetail(lcode);
    }

    @Override
    public Book getBook(String bcode) throws Exception {
        return paymentMapper.bookDetail(bcode);
    }

    @Override
    @Transactional
    public int paymentInsert(String id, String lcode, Payment payment) throws Exception {
        Map<String, String> data = new HashMap<>();
        data.put("lcode", lcode);
        data.put("id", id);

        boolean isMaxStudent = paymentMapper.isMaxStudent(lcode);

        if (isMaxStudent) {
            paymentMapper.paymentInsert(payment);
            registerMapper.registerInsert(data);

            int pno = paymentMapper.paymentNo();

            return pno;
        } else {
            return -1;
        }
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addPayment (Delivery delivery, Serve serve, int pt, String id) throws Exception {
        try {
        paymentMapper.deliveryInsert(delivery);
        paymentMapper.serveInsert(serve);

        Map<String, Object> pnt = new HashMap<>();
        pnt.put("pt", pt);
        pnt.put("id", id);

        paymentMapper.pointUpdate(pnt);
        paymentMapper.dnoUpdate(delivery);

        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<Delivery> deliveryList() throws Exception {
        return paymentMapper.deliveryList();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deletePayment(String lcode, String id, int pno) throws Exception {
        Map<String, String> data = new HashMap<>();
        data.put("lcode", lcode);
        data.put("id", id);

        try {
            paymentMapper.paymentDelete(pno);
            paymentMapper.deliveryDelete(pno);
            paymentMapper.serveDelete(pno);
            registerMapper.registerDelete(data);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public void pointUpdate(int pt, String id) throws Exception {
        Map<String, Object> pnt = new HashMap<>();
        pnt.put("pt", pt);
        pnt.put("id", id);

        paymentMapper.pointUpdate(pnt);
    }

    @Override
    public List<PaymentVO> paymentList(Page page) throws Exception {
        return paymentMapper.paymentList(page);
    }

    @Override
    public PaymentVO myPaymentDetail(int pno) throws Exception {
        return paymentMapper.myPaymentDetail(pno);
    }

    @Override
    public int period(String lcode) throws Exception {
        return paymentMapper.period(lcode);
    }

    @Override
    public int payCount(Page page) throws Exception {
        return paymentMapper.payCount(page);
    }

    @Override
    public void paymentNoBookInsert(Payment payment) throws Exception {
        paymentMapper.paymentNoBookInsert(payment);
    }
    @Override
    public int calcProfitBook() throws Exception {
        return paymentMapper.calcProfitBook();
    }
}
