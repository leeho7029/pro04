package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PaymentMapper {
    public Lecture lectureDetail(String lcode) throws Exception;
    public Book bookDetail(String bcode) throws Exception;
    public Payment paymentDetail(Map<String, Object> payment) throws Exception;
    public int getCount(String lcode) throws Exception;
    public void paymentInsert(Payment payment) throws Exception;
    public int paymentNo() throws Exception;
    public List<Delivery> deliveryList() throws Exception;
    public void deliveryInsert(Delivery delivery) throws Exception;
    public int deliveryNo() throws Exception;
    public void dnoUpdate(Delivery delivery) throws Exception;
    public void serveInsert(Serve serve) throws Exception;
    public void pointUpdate(Map<String, Object> pnt) throws Exception;
    public void paymentDelete (int pno) throws Exception;
    public void deliveryDelete(int pno) throws Exception;
    public void serveDelete(int pno) throws Exception;
    public List<PaymentVO> paymentList(Page page) throws Exception;
    public PaymentVO myPaymentDetail(int pno) throws Exception;
    public int period (String lcode) throws Exception;
    public int payCount(Page page) throws Exception;
    public void paymentNoBookInsert(Payment payment)throws Exception;
    public int calcProfitBook() throws Exception;
    public boolean already(Map<String, String> data) throws Exception;
    public boolean isMaxStudent(String lcode) throws Exception;

}
