package kr.co.haebop.service;

import kr.co.haebop.domain.FileInfo;
import kr.co.haebop.domain.FileInfo2;
import kr.co.haebop.repository.FileInfo2Repository;
import kr.co.haebop.repository.FileInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileInfo2ServiceImpl implements FileInfo2Service{
    @Autowired
    private FileInfo2Repository fileInfo2Repository;
    @Override
    public List<FileInfo2> fileInfoDetail(int seq) throws Exception {
        return fileInfo2Repository.fileInfoDetail(seq);
    }
    @Override
    public void fileInfoEdit(FileInfo2 dto) throws Exception {
        fileInfo2Repository.fileInfoEdit(dto);
    }
    @Override
    public List<FileInfo2> fileInfoList(int seq) throws Exception {
        return fileInfo2Repository.fileInfoList(seq);  }

    @Override
    public void fileRegister(FileInfo2 fileInfo2) throws Exception {
        fileInfo2Repository.fileRegister(fileInfo2);
    }

    @Override
    public List<FileInfo2> fileInfoList2() throws Exception {
        return fileInfo2Repository.fileInfoList2();
    }
}