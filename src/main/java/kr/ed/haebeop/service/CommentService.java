package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.util.BoardPage;

import java.util.List;

public interface CommentService {
    public List<Comment> commentList(BoardPage page) throws Exception;
    public int getCount(int cno) throws Exception;
    public void commentInsert(Comment dto) throws Exception;
    public void commentDelete(int comNo) throws Exception;
}
