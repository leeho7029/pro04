package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Delivery;
import kr.ed.haebeop.domain.DeliveryVO;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface DeliveryService {

    public List<DeliveryVO> deliveryList() throws Exception;
    public DeliveryVO deliveryDetail(int dno) throws Exception;
    public void dcodeUpdate (String dcode, int dno) throws Exception;
    public void deliveryUpdate (Delivery delivery) throws Exception;
    public DeliveryVO myDeliveryDetail(int dno) throws Exception;
    public int getCount(Page page) throws Exception;
}
