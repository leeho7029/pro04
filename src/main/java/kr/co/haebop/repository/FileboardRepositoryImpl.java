package kr.co.haebop.repository;

import kr.co.haebop.domain.Fileboard;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FileboardRepositoryImpl implements FileboardRepository{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public void writeArticle(Fileboard fileboard) throws Exception {
        sqlSession.insert("fileboard.writeArticle", fileboard);
    }

    @Override
    public void fileRegister(Fileboard fileboard) throws Exception {
        sqlSession.insert("fileboard.fileRegister", fileboard);
    }

    @Override
    public List<Fileboard> fileList() throws Exception {
        return sqlSession.selectList("fileboard.fileboardList");
    }

    @Override
    public Fileboard fileDetail(int articleno) throws Exception {
        return sqlSession.selectOne("fileboard.fileboardDetail", articleno);
    }

    @Override
    public void fileboardDelete(int articleno) throws Exception {
        sqlSession.delete("fileboard.fileboardDelete", articleno);
    }

    @Override
    public void fileboardEdit(Fileboard dto) throws Exception {
        sqlSession.update("fileboard.fileboardEdit",dto );
    }
}
