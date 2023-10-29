package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.FileInfo;
import kr.ed.haebeop.persistence.FileInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileInfoServiceImpl implements FileInfoService {

    @Autowired
    private FileInfoMapper fileInfoMapper;

    @Override
    public List<FileInfo> fileInfoList(int articleNo) throws Exception {
        return fileInfoMapper.fileInfoList(articleNo);
    }
}
