package kr.co.haebop.repository;

import kr.co.haebop.domain.FileInfo2;
import kr.co.haebop.domain.Fileboard;
import kr.co.haebop.domain.Teacher;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class FileInfo2RepositoryImpl implements FileInfo2Repository {
    @Autowired
    SqlSession sqlSession;

    @Override
    public List<FileInfo2> fileInfoDetail(int seq) throws Exception {
        return sqlSession.selectList("fileInfo2.fileInfoDetail", seq);
    }

    @Override
    public void fileInfoEdit(FileInfo2 dto) throws Exception {
        sqlSession.update("fileInfo2.fileInfoEdit",dto );
    }
    @Override
    public List<FileInfo2> fileInfoList(int seq) throws Exception {
        return sqlSession.selectList("fileInfo2.fileInfoList", seq);
    }

    @Override
    public void fileInfoInsert(Teacher teacher) throws Exception {
        sqlSession.insert("fileInfo2.fileInfoInsert", teacher);
    }

    @Override
    public void fileInfoDelete(int seq) throws Exception {
        sqlSession.update("fileInfo2.fileInfoDelete", seq);
    }
    @Override
    public void fileRegister(FileInfo2 fileInfo2) throws Exception{
        sqlSession.insert("fileInfo2.fileRegister",fileInfo2);
    }

    @Override
    public List<FileInfo2> fileInfoList2() throws Exception {
        return sqlSession.selectList("fileInfo2.fileInfoList2");
    }
}
