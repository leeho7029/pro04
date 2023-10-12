package kr.co.haebop.service;

import kr.co.haebop.domain.Comment;
import kr.co.haebop.repository.CommentRepository;
import kr.co.haebop.util.CommunityPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentRepository commentRepository;

    @Override
    public List<Comment> commentList(CommunityPage page) throws Exception {
        return commentRepository.commentList(page);
    }

    @Override
    public int getCount(int cno) throws Exception {
        return commentRepository.getCount(cno);
    }

    @Override
    public void commentInsert(Comment dto) throws Exception {
        commentRepository.commentInsert(dto);
    }

    @Override
    public void communityDelete(int comNo) throws Exception {
        commentRepository.communityDelete(comNo);
    }
    
}
