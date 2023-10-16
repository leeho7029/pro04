package kr.co.haebop.repository;

import kr.co.haebop.domain.Register;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RegisterRepositoryImpl implements RegisterRepository{
    @Autowired
    SqlSession sqlSession;

    @Override
    public List<Register> registerList() throws Exception {
        return sqlSession.selectList("register.registerList");
    }

    @Override
    public Register registerDetail(int regno) throws Exception {
        return sqlSession.selectOne("register.registerDetail",regno);
    }

    @Override
    public void registerInsert(Register register) throws Exception {
        sqlSession.insert("register.registerInsert",register);
    }

    @Override
    public void registerDelete(int regno) throws Exception {
        sqlSession.delete("register.registerDelete",regno);
    }

    @Override
    public Register registerSelect(String id) throws Exception {
      return  sqlSession.selectOne("register.registerSelect",id);
    }
}
