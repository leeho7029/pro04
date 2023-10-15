package kr.co.haebop.service;

import kr.co.haebop.domain.FileInfo;
import kr.co.haebop.domain.FileInfo2;

import java.util.List;

public interface FileInfo2Service {
    public List<FileInfo2> fileInfoDetail(int seq) throws Exception;
    public void fileInfoEdit(FileInfo2 dto) throws Exception;
    public List<FileInfo2> fileInfoList(int seq) throws Exception;
    public void fileRegister(FileInfo2 fileInfo2) throws Exception;
    public List<FileInfo2> fileInfoList2() throws Exception;

}
