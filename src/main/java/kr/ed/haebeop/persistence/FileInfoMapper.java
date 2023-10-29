package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.DataRoom;
import kr.ed.haebeop.domain.FileInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileInfoMapper {
    public List<FileInfo> fileInfoList(int articleNo) throws Exception;
    public void fileInfoInsert(DataRoom dataRoom) throws Exception;
    public void fileInfoDelete(int articleNo) throws Exception;

}
