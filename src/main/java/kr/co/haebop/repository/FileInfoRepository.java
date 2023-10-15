package kr.co.haebop.repository;

import kr.co.haebop.domain.FileInfo;
import kr.co.haebop.domain.FileInfo2;
import kr.co.haebop.domain.Fileboard;
import kr.co.haebop.domain.Teacher;

import java.util.List;

public interface FileInfoRepository {
    public List<FileInfo> fileInfoDetail(int articleno) throws Exception;
    public List<FileInfo2> fileInfo2Detail(int seq) throws Exception;
    public void fileInfoEdit(FileInfo dto) throws Exception;
    public void fileInfo2Edit(FileInfo2 dto) throws Exception;
    public List<FileInfo> fileInfoList(int articleno) throws Exception;
    public List<FileInfo2> fileInfo2List(int seq) throws Exception;
    public void fileInfoInsert(Fileboard fileboard) throws Exception;
    public void fileInfo2Insert(Teacher teacher) throws Exception;
    public void fileInfoDelete(int articleno) throws Exception;
    public void fileInfo2Delete(int seq) throws Exception;
}
