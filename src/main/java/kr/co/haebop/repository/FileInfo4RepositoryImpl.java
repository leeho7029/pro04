package kr.co.haebop.repository;

import kr.co.haebop.domain.FileInfo4;
import kr.co.haebop.domain.FileInfo4;
import kr.co.haebop.domain.Lecture;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FileInfo4RepositoryImpl implements FileInfo4Repository {
    @Autowired
    SqlSession sqlSession;

    @Override
    public List<FileInfo4> fileInfoDetail(int bkno) throws Exception {
        return sqlSession.selectList("fileInfo4.fileInfoDetail", bkno);
    }

    @Override
    public void fileInfoEdit(FileInfo4 dto) throws Exception {
        sqlSession.update("fileInfo4.fileInfoEdit",dto );
    }

    @Override
    public List<FileInfo4> fileInfoList(int bkno) throws Exception {
        return sqlSession.selectList("fileInfo4.fileInfoList",bkno);
    }

    @Override
    public void fileInfoInsert(Lecture lecture) throws Exception {
        sqlSession.insert("fileInfo4.fileInfoInsert", lecture);
    }

    @Override
    public void fileInfoDelete(int bkno) throws Exception {
        sqlSession.update("fileInfo4.fileInfoDelete", bkno);
    }

    @Override
    public void fileRegister(FileInfo4 fileInfo4) throws Exception {
        sqlSession.insert("fileInfo4.fileRegister",fileInfo4);
    }

    @Override
    public List<FileInfo4> fileInfoList2() throws Exception {
        return sqlSession.selectList("fileInfo4.fileInfoList2");
    }
}