package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.persistence.CommentMapper;
import kr.ed.haebeop.util.BoardPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> commentList(BoardPage page) throws Exception {
        return commentMapper.commentList(page);
    }

    @Override
    public int getCount(int cno) throws Exception {
        return commentMapper.getCount(cno);
    }

    @Override
    public void commentInsert(Comment dto) throws Exception {
        commentMapper.commentInsert(dto);
    }

    @Override
    public void commentDelete(int comNo) throws Exception {
        commentMapper.commentDelete(comNo);
    }
}
