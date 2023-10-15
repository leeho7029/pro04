package kr.co.haebop.repository;

import kr.co.haebop.domain.FileInfo;
import kr.co.haebop.domain.FileInfo2;
import kr.co.haebop.domain.Fileboard;
import kr.co.haebop.domain.Teacher;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class FileInfoRepositoryImpl implements FileInfoRepository {


    @Autowired
    private SqlSession sqlSession;
    @Override
    public List<FileInfo> fileInfoDetail(int articleno) throws Exception {
        return sqlSession.selectList("fileInfo.fileInfoDetail", articleno);
    }
    @Override
    public List<FileInfo2> fileInfo2Detail(int seq) throws Exception {
        return sqlSession.selectList("fileInfo.fileInfo2Detail", seq);
    }

    @Override
    public void fileInfoEdit(FileInfo dto) throws Exception {
        sqlSession.update("fileInfo.fileInfoEdit",dto );
    }
    @Override
    public List<FileInfo> fileInfoList(int articleno) throws Exception {
        return sqlSession.selectList("fileInfo.fileInfoList", articleno);
    }
    @Override
    public List<FileInfo2> fileInfo2List(int seq) throws Exception {
        return sqlSession.selectList("fileInfo.fileInfo2List", seq);
    }
    @Override
    public void fileInfoInsert(Fileboard fileboard) throws Exception {
        sqlSession.insert("fileInfo.fileInfoInsert", fileboard);
    }

    @Override
    public void fileInfoDelete(int articleno) throws Exception {
        sqlSession.update("fileInfo.fileInfoDelete", articleno);
    }

    @Override
    public void fileInfo2Edit(FileInfo2 dto) throws Exception {
        sqlSession.update("fileInfo.fileInfo2Edit",dto );
    }

    @Override
    public void fileInfo2Insert(Teacher teacher) throws Exception {
        sqlSession.insert("fileInfo.fileInfo2Insert", teacher);
    }

    @Override
    public void fileInfo2Delete(int seq) throws Exception {
        sqlSession.update("fileInfo.fileInfo2Delete", seq);
    }
}
