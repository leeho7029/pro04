package kr.co.haebop.repository;

import kr.co.haebop.domain.Test;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TestRepositoryImpl implements TestRepository {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Test> testList() throws Exception {
        return sqlSession.selectList("test.testList");
    }
}