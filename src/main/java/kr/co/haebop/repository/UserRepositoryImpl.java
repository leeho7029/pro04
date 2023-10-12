package kr.co.haebop.repository;

import kr.co.haebop.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserRepositoryImpl implements UserRepository {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<User> UserList() throws Exception {
        return sqlSession.selectList("user.userList");
    }

    @Override
    public User getUser(String id) {
        return sqlSession.selectOne("user.getUser",id);
    }

    @Override
    public void UserInsert(User user) {
        sqlSession.insert("user.UserInsert",user);
    }

    @Override
    public User loginCheck(String id) throws Exception {
        return sqlSession.selectOne("user.loginCheck",id);
    }

    @Override
    public void updateVisited(String id) throws Exception {
        sqlSession.update("user.updateVisited", id);
    }

    @Override
    public void UserEdit(User user) throws Exception {
        sqlSession.update("user.UserEdit", user);
    }

    @Override
    public void UserDelete(String id) throws Exception {
        sqlSession.delete("user.UserDelete", id);
    }

    @Override
    public int UserCnt() throws Exception {
        return sqlSession.selectOne("user.UserCnt");
    }
}
