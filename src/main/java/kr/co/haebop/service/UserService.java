package kr.co.haebop.service;

import kr.co.haebop.domain.User;

import java.util.List;

public interface UserService {
    public List<User> UserList() throws Exception;
    public User getUser(String id);
    public boolean idCheck(String id);
    public void UserInsert(User user);
    public boolean loginCheck(String id, String pw) throws Exception;
    public void updateVisited(String id) throws Exception;
    public void UserEdit(User user) throws Exception;
    public void UserDelete(String id) throws Exception;
    public int UserCnt() throws Exception;

}
