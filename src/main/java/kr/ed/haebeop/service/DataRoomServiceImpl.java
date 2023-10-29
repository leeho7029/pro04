package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.DataRoom;
import kr.ed.haebeop.persistence.DataRoomMapper;
import kr.ed.haebeop.persistence.FileInfoMapper;
import kr.ed.haebeop.util.Page;
import org.checkerframework.checker.units.qual.K;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DataRoomServiceImpl implements DataRoomService {
    @Autowired
    private DataRoomMapper dataRoomMapper;

    @Autowired
    private FileInfoMapper fileInfoMapper;

    @Override
    public List<DataRoom> dataRoomList(Page page) throws Exception {
        return dataRoomMapper.dataRoomList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return dataRoomMapper.getCount(page);
    }

    @Transactional
    @Override
    public void dataRoomInsert(DataRoom dataRoom) throws Exception {
        dataRoomMapper.dataRoomInsert(dataRoom);
        fileInfoMapper.fileInfoInsert(dataRoom);
    }

    @Override
    public DataRoom dataRoomDetail(int articleNo) throws Exception {
        return dataRoomMapper.dataRoomDetail(articleNo);
    }

    @Override
    public DataRoom dataRoomRef(int articleNo, String type) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("articleNo", articleNo);
        data.put("type", type);
        return dataRoomMapper.dataRoomRef(data);
    }

    @Transactional
    @Override
    public void dataRoomEdit(DataRoom dataRoom) throws Exception {
        dataRoomMapper.dataRoomEdit(dataRoom);
        if(dataRoom.getFileInfoList().get(0).getSaveFolder() != null) {
            fileInfoMapper.fileInfoDelete(dataRoom.getArticleNo());
            fileInfoMapper.fileInfoInsert(dataRoom);
        }
    }

    @Override
    public void dataRoomDelete(int articleNo) throws Exception {
        dataRoomMapper.dataRoomDelete(articleNo);
    }
}
