package kr.co.haebop.service;

import kr.co.haebop.domain.FileInfo4;
import kr.co.haebop.domain.Lecture;
import kr.co.haebop.repository.FileInfo4Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FileInfo4ServiceImpl implements FileInfo4Service {
    @Autowired
    FileInfo4Repository fileInfo4Repository;

    @Override
    public List<FileInfo4> fileInfoDetail(int bkno) throws Exception {
        return fileInfo4Repository.fileInfoDetail(bkno);
    }

    @Override
    public void fileInfoEdit(FileInfo4 dto) throws Exception {
        fileInfo4Repository.fileInfoEdit(dto);
    }

    @Override
    public List<FileInfo4> fileInfoList(int bkno) throws Exception {
        return fileInfo4Repository.fileInfoList(bkno);
    }

    @Override
    public void fileInfoInsert(Lecture lecture) throws Exception {
        fileInfo4Repository.fileInfoInsert(lecture);
    }

    @Override
    public void fileInfoDelete(int bkno) throws Exception {
        fileInfo4Repository.fileInfoDelete(bkno);
    }

    @Override
    public void fileRegister(FileInfo4 fileInfo4) throws Exception {
        fileInfo4Repository.fileRegister(fileInfo4);
    }

    @Override
    public List<FileInfo4> fileInfoList2() throws Exception {
        return fileInfo4Repository.fileInfoList2();
    }
}