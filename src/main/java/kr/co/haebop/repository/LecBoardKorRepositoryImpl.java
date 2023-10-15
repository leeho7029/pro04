package kr.co.haebop.repository;

import kr.co.haebop.domain.LecBoardKor;
import kr.co.haebop.domain.Lecture;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class LecBoardKorRepositoryImpl implements LecBoardKorRepository{
    @Autowired
    SqlSession sqlSession;



    @Override
    public List<LecBoardKor> LecBoardKorList() throws Exception {
        return sqlSession.selectList("LecBoardKor.LecBoardKorList");
    }

    @Override
    public LecBoardKor LecBoardKorDetail(int seq) throws Exception {
        return sqlSession.selectOne("LecBoardKor.LecBoardKorDetail", seq);
    }

    @Override
    public void LecBoardKorInsert(LecBoardKor LecBoardKor) throws Exception {
        sqlSession.insert("LecBoardKor.LecBoardKorInsert",LecBoardKor);
    }

    @Override
    public void LecBoardKorDelete(int seq) throws Exception {
        sqlSession.delete("LecBoardKor.LecBoardKorDelete",seq);
    }

    @Override
    public void LecBoardKorEdit(LecBoardKor lecBoardKor) throws Exception {
        sqlSession.update("LecBoardKor.LecBoardKorEdit",lecBoardKor);
    }
}
