package kr.co.haebop.repository;

import kr.co.haebop.domain.Notice;
import kr.co.haebop.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NoticeRepositoryImpl implements NoticeRepository{
    @Autowired
    private SqlSession sqlSession;
    @Override
    public List<Notice> noticeList() throws Exception {
        return sqlSession.selectList("notice.noticeList");
    }

    @Override
    public Notice noticeDetail(int seq) throws Exception {
        return sqlSession.selectOne("notice.noticeDetail", seq);
    }

    @Override
    public void noticeInsert(Notice notice) throws Exception {
        sqlSession.insert("notice.noticeInsert",notice);
    }

    @Override
    public void noticeDelete(int seq) throws Exception {
        sqlSession.delete("notice.noticeDelete",seq);
    }

    @Override
    public void noticeEdit(Notice notice) throws Exception {
        sqlSession.update("notice.noticeEdit",notice);
    }
}
