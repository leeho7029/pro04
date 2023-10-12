package kr.co.haebop.repository;


import kr.co.haebop.domain.Category;
import kr.co.haebop.domain.Community;
import kr.co.haebop.domain.CommunityVO;
import kr.co.haebop.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class CommunityRepositoryImpl implements CommunityRepository {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<CommunityVO> communityList(Page page) throws Exception {
        return sqlSession.selectList("community.communityList", page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return sqlSession.selectOne("community.getCount", page);
    }

    @Override
    public List<Category> categeryList() throws Exception {
        return sqlSession.selectList("community.cateList");
    }

    @Transactional
    @Override
    public CommunityVO communityDetail(int cno) throws Exception {
        sqlSession.update("community.cntCount", cno);
        return sqlSession.selectOne("community.communityDetail", cno);
    }

    @Override
    public void communityInsert(Community dto) throws Exception {
        sqlSession.insert("community.communityInsert", dto);
    }

    @Override
    public void communityDelete(int cno) throws Exception {
        sqlSession.delete("community.communityDelete", cno);
    }

    @Override
    public void communityEdit(Community dto) throws Exception {
        sqlSession.update("community.communityEdit", dto);
    }

    @Override
    public int communityCnt() throws Exception {
        return sqlSession.selectOne("community.communityCnt");
    }
}
