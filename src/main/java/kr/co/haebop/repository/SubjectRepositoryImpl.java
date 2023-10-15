package kr.co.haebop.repository;

import kr.co.haebop.domain.Subject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SubjectRepositoryImpl implements SubjectRepository {
    @Autowired
    SqlSession sqlSession;

    @Override
    public List<Subject> subjectList() throws Exception {
        return sqlSession.selectList("subject.subjectList");
    }

    @Override
    public Subject subjectDetail(int subno) throws Exception {
        return sqlSession.selectOne("subject.subjectDetail",subno);
    }

    @Override
    public void subjectInsert(Subject subject) throws Exception {
        sqlSession.insert("subject.subjectInsert",subject);
    }

    @Override
    public void subjectDelete(int subno) throws Exception {
        sqlSession.delete("subject.subjectDelete",subno);
    }
}
