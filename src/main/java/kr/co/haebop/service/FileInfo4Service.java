package kr.co.haebop.service;

import kr.co.haebop.domain.FileInfo4;
import kr.co.haebop.domain.Lecture;

import java.util.List;

public interface FileInfo4Service {
    public List<FileInfo4> fileInfoDetail(int bkno) throws Exception;
    public void fileInfoEdit(FileInfo4 dto) throws Exception;
    public List<FileInfo4> fileInfoList(int bkno) throws Exception;
    public void fileInfoInsert(Lecture lecture) throws Exception;
    public void fileInfoDelete(int bkno) throws Exception;
    public void fileRegister(FileInfo4 fileInfo4) throws Exception;
    public List<FileInfo4> fileInfoList2() throws Exception;
}
