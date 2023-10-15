package kr.co.haebop.repository;

import kr.co.haebop.domain.FileInfo2;
import kr.co.haebop.domain.Fileboard;
import kr.co.haebop.domain.Teacher;

import java.util.List;

public interface FileInfo2Repository {
    public List<FileInfo2> fileInfoDetail(int seq) throws Exception;
    public void fileInfoEdit(FileInfo2 dto) throws Exception;
    public List<FileInfo2> fileInfoList(int seq) throws Exception;
    public void fileInfoInsert(Teacher teacher) throws Exception;
    public void fileInfoDelete(int seq) throws Exception;
    public void fileRegister(FileInfo2 fileInfo2) throws Exception;
    public List<FileInfo2> fileInfoList2() throws Exception;
}
