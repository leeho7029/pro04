package kr.co.haebop.service;

import kr.co.haebop.domain.FileInfo;
import kr.co.haebop.domain.FileInfo2;
import kr.co.haebop.domain.Fileboard;

import java.util.List;

public interface FileInfoService {
    public List<FileInfo> fileInfoDetail(int articleno) throws Exception;
    public void fileInfoEdit(FileInfo dto) throws Exception;
    public List<FileInfo> fileInfoList(int articleno) throws Exception;


}
