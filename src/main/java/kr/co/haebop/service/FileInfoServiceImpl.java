package kr.co.haebop.service;

import kr.co.haebop.domain.FileInfo;
import kr.co.haebop.domain.FileInfo2;
import kr.co.haebop.domain.Fileboard;
import kr.co.haebop.repository.FileInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FileInfoServiceImpl implements FileInfoService{
    @Autowired
    private FileInfoRepository fileInfoRepository;
    @Override
    public List<FileInfo> fileInfoDetail(int articleno) throws Exception {
        return fileInfoRepository.fileInfoDetail(articleno);
    }
    @Override
    public void fileInfoEdit(FileInfo dto) throws Exception {
        fileInfoRepository.fileInfoEdit(dto);
    }
@Override
    public List<FileInfo> fileInfoList(int articleno) throws Exception {
        return fileInfoRepository.fileInfoList(articleno);
    }

}
