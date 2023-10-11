package kr.co.haebop.repository;

import kr.co.haebop.domain.User;

import java.util.List;

public interface UserRepository {
    public List<User> UserList () throws Exception;
    public User getUser(String id);
    public void UserInsert(User user);
    public User loginCheck(String id) throws Exception;
    public void updateVisited(String id) throws Exception;

    public void UserEdit(User user) throws Exception;
    public void UserDelete(String id) throws Exception;
    public int UserCnt() throws Exception;

}
