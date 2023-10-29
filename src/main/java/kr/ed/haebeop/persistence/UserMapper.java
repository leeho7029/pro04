package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {
    public List<User> userList(Page page) throws Exception;
    public User getUser(String id) throws Exception;
    public void updateVisited(String id) throws Exception;
    public void userInsert(User member) throws Exception;
    public User loginCheck(String id) throws Exception;
    public void userEdit(User member) throws Exception;
    public void userDelete(String id) throws Exception;
    public int userCnt(Page page) throws Exception;
    public void updatePt(Map<String, Object> data) throws Exception;
    public void minusPoint(Map<String, String> data) throws Exception;
    public void updateIsStudy(Map<String, Object> data) throws Exception;
    public boolean getIsStudy(String id) throws Exception;
    public List<Map<String, Integer>> userCntList() throws Exception;
    public List<String> getIdList() throws Exception;
    public List<String> findTeacherId(String tid) throws Exception;

}
