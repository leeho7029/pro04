package kr.co.haebop.repository;

import kr.co.haebop.domain.FileInfo3;
import kr.co.haebop.domain.Lecture;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.jdbc.Sql;

import java.util.List;

@Repository
public class FileInfo3RepositoryImpl implements FileInfo3Repository{
@Autowired
    SqlSession sqlSession;

    @Override
    public List<FileInfo3> fileInfoDetail(int lecno) throws Exception {
        return sqlSession.selectList("fileInfo3.fileInfoDetail", lecno);
    }

    @Override
    public void fileInfoEdit(FileInfo3 dto) throws Exception {
        sqlSession.update("fileInfo3.fileInfoEdit",dto );
    }

    @Override
    public List<FileInfo3> fileInfoList(int lecno) throws Exception {
        return sqlSession.selectList("fileInfo3.fileInfoList",lecno);
    }

    @Override
    public void fileInfoInsert(Lecture lecture) throws Exception {
        sqlSession.insert("fileInfo3.fileInfoInsert", lecture);
    }

    @Override
    public void fileInfoDelete(int lecno) throws Exception {
        sqlSession.update("fileInfo3.fileInfoDelete", lecno);
    }

    @Override
    public void fileRegister(FileInfo3 fileInfo3) throws Exception {
        sqlSession.insert("fileInfo3.fileRegister",fileInfo3);
    }

    @Override
    public List<FileInfo3> fileInfoList2() throws Exception {
        return sqlSession.selectList("fileInfo3.fileInfoList2");
    }
}
