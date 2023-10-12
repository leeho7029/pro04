package kr.co.haebop.service;

import kr.co.haebop.domain.Comment;
import kr.co.haebop.util.CommunityPage;

import java.util.List;

public interface CommentService {
    public List<Comment> commentList(CommunityPage page) throws Exception;
    public int getCount(int cno) throws Exception;
    public void commentInsert(Comment dto) throws Exception;
    public void communityDelete(int comNo) throws Exception;
}
