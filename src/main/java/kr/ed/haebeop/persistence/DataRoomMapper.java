package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.DataRoom;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface DataRoomMapper {
    public List<DataRoom> dataRoomList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public void dataRoomInsert(DataRoom dataRoom) throws Exception;
    public DataRoom dataRoomDetail(int articleNo) throws Exception;
    public DataRoom dataRoomRef(Map<String, Object> data) throws Exception;
    public void dataRoomEdit(DataRoom dataRoom) throws Exception;
    public void dataRoomDelete(int articleNo) throws Exception;
}
