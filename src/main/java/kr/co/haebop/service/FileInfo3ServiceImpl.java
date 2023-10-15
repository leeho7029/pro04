package kr.co.haebop.service;

import kr.co.haebop.domain.FileInfo3;
import kr.co.haebop.domain.Lecture;
import kr.co.haebop.repository.FileInfo3Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileInfo3ServiceImpl implements FileInfo3Service {
    @Autowired
    FileInfo3Repository fileInfo3Repository;

    @Override
    public List<FileInfo3> fileInfoDetail(int lecno) throws Exception {
        return fileInfo3Repository.fileInfoDetail(lecno);
    }

    @Override
    public void fileInfoEdit(FileInfo3 dto) throws Exception {
        fileInfo3Repository.fileInfoEdit(dto);
    }

    @Override
    public List<FileInfo3> fileInfoList(int lecno) throws Exception {
        return fileInfo3Repository.fileInfoList(lecno);
    }

    @Override
    public void fileInfoInsert(Lecture lecture) throws Exception {
        fileInfo3Repository.fileInfoInsert(lecture);
    }

    @Override
    public void fileInfoDelete(int lecno) throws Exception {
        fileInfo3Repository.fileInfoDelete(lecno);
    }

    @Override
    public void fileRegister(FileInfo3 fileInfo3) throws Exception {
        fileInfo3Repository.fileRegister(fileInfo3);
    }

    @Override
    public List<FileInfo3> fileInfoList2() throws Exception {
        return fileInfo3Repository.fileInfoList2();
    }
}
