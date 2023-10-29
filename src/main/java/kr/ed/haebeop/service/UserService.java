package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.util.Page;

import java.util.List;
import java.util.Map;

public interface UserService {
    public List<User> userList(Page page) throws Exception;
    public User getUser(String id) throws Exception;
    public boolean idCheck(String id) throws Exception;
    public void userInsert(User user) throws Exception;
    public boolean loginCheck(String id, String pw) throws Exception;
    public void updateVisited(String id) throws Exception;
    public void userEdit(User user) throws Exception;
    public void userDelete(String id) throws Exception;
    public int userCnt(Page page) throws Exception;
    public void updateIsStudy(String id, boolean isStudy) throws Exception;
    public boolean getIsStudy(String id) throws Exception;
    public List<Map<String, Integer>> userCntList() throws Exception;
    public List<String> getIdList() throws Exception;
    public List<String> findTeacherId(String tid) throws Exception;
}
