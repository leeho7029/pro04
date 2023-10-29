package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Delivery;
import kr.ed.haebeop.domain.DeliveryVO;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface DeliveryMapper {
    public List<DeliveryVO> deliveryList() throws Exception;
    public DeliveryVO deliveryDetail(int dno) throws Exception;
    public void dcodeUpdate(Map<String, Object> data) throws Exception;
    public void deliveryUpdate (Delivery delivery) throws Exception;
    public DeliveryVO myDeliveryDetail(int dno) throws Exception;
    public int getCount(Page page) throws Exception;
}
