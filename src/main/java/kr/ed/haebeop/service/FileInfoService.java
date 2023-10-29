package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.FileInfo;

import java.util.List;

public interface FileInfoService {
    public List<FileInfo> fileInfoList(int articleNo) throws Exception;
}
