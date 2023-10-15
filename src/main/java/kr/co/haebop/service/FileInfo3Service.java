package kr.co.haebop.service;

import kr.co.haebop.domain.FileInfo3;
import kr.co.haebop.domain.Lecture;

import java.util.List;

public interface FileInfo3Service {
    public List<FileInfo3> fileInfoDetail(int lecno) throws Exception;
    public void fileInfoEdit(FileInfo3 dto) throws Exception;
    public List<FileInfo3> fileInfoList(int lecno) throws Exception;
    public void fileInfoInsert(Lecture lecture) throws Exception;
    public void fileInfoDelete(int lecno) throws Exception;
    public void fileRegister(FileInfo3 fileInfo3) throws Exception;
    public List<FileInfo3> fileInfoList2() throws Exception;
}
