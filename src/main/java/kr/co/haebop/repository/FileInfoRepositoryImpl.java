package kr.co.haebop.repository;

import kr.co.haebop.domain.FileInfo;
import kr.co.haebop.domain.Fileboard;
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
    public void fileInfoEdit(FileInfo dto) throws Exception {
        sqlSession.update("fileInfo.fileInfoEdit",dto );
    }
    @Override
    public List<FileInfo> fileInfoList(int articleno) throws Exception {
        return sqlSession.selectList("fileInfo.fileInfoList", articleno);
    }

    @Override
    public void fileInfoInsert(Fileboard fileboard) throws Exception {
        sqlSession.insert("fileInfo.fileInfoInsert", fileboard);
    }

    @Override
    public void fileInfoDelete(int articleno) throws Exception {
        sqlSession.update("fileInfo.fileInfoDelete", articleno);
    }
}
