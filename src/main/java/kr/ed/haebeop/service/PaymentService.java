package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface PaymentService {
    public Payment PaymentDetail(String id, String lcode) throws Exception;
    public boolean payCheck(String id, String lcode) throws Exception;
    public int getCount(String lcode) throws Exception;
    public Lecture getLecture(String lcode) throws Exception;
    public Book getBook(String bcode) throws Exception;
    public void addPayment (Delivery delivery, Serve serve, int pt, String id) throws Exception;
    public List<Delivery> deliveryList() throws Exception;
    public void deletePayment (String lcode, String id, int pno) throws Exception;
    public void pointUpdate(int pt, String id) throws Exception;
    public List<PaymentVO> paymentList(Page page) throws Exception;
    public PaymentVO myPaymentDetail(int pno) throws Exception;
    public int period(String lcode) throws Exception;
    public int payCount(Page page) throws Exception;
    public void paymentNoBookInsert(Payment payment)throws Exception;
    public int calcProfitBook() throws Exception;
    public boolean already(String lcode, String id) throws Exception;
    public int paymentInsert(String id, String lcode, Payment payment) throws Exception;

}
