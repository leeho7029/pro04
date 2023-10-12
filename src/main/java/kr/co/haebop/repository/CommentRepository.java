package kr.co.haebop.repository;

import kr.co.haebop.domain.Comment;
import kr.co.haebop.util.CommunityPage;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CommentRepository {
    public List<Comment> commentList(CommunityPage page) throws Exception;
    public int getCount(int cno) throws Exception;
    public void commentInsert(Comment dto) throws Exception;
    public void communityDelete(int comNo) throws Exception;
}
