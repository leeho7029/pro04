package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Delivery;
import kr.ed.haebeop.domain.DeliveryVO;
import kr.ed.haebeop.persistence.DeliveryMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DeliveryServiceImpl implements DeliveryService{

    @Autowired
    private DeliveryMapper deliveryMapper;

    @Override
    public List<DeliveryVO> deliveryList() throws Exception {
        return deliveryMapper.deliveryList();
    }

    @Override
    public DeliveryVO deliveryDetail(int dno) throws Exception {
        return deliveryMapper.deliveryDetail(dno);
    }

    @Override
    public void dcodeUpdate(String dcode, int dno) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("dcode", dcode);
        data.put("dno", dno);

        deliveryMapper.dcodeUpdate(data);
    }

    @Override
    public void deliveryUpdate(Delivery delivery) throws Exception {
        deliveryMapper.deliveryUpdate(delivery);
    }

    @Override
    public DeliveryVO myDeliveryDetail(int dno) throws Exception {
        return deliveryMapper.myDeliveryDetail(dno);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return deliveryMapper.getCount(page);
    }
}
