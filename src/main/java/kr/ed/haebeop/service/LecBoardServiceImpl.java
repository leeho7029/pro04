package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.LecBoard;
import kr.ed.haebeop.persistence.LecBoardMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LecBoardServiceImpl implements LecBoardService{
    @Autowired
    private LecBoardMapper lecBoardMapper;

    @Override
    public List<LecBoard> lecBoardList(Page page) throws Exception {
        return lecBoardMapper.lecBoardList(page);
    }

    @Override
    public List<LecBoard> noAnswerList(Page page) throws Exception {
        return lecBoardMapper.noAnswerList(page);
    }

    @Override
    public LecBoard lecBoardDetail(int qno) throws Exception {
        return lecBoardMapper.lecBoardDetail(qno);
    }

    @Override
    public LecBoard lecBoardRef(int qno, String type) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("qno", qno);
        data.put("type", type);
        return lecBoardMapper.lecBoardRef(data);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return lecBoardMapper.getCount(page);
    }

    @Override
    public int noAnswerCount(Page page) throws Exception {
        return lecBoardMapper.noAnswerCount(page);
    }

    @Override
    public int noAnswerCount() throws Exception {
        return lecBoardMapper.noAnswerCount();
    }
@Transactional
    @Override
    public void questionInsert(LecBoard dto) throws Exception {
    lecBoardMapper.questionInsert(dto);
    lecBoardMapper.parUpdate(dto);
    }

    @Override
    public void parUpdate(LecBoard dto) throws Exception {
    lecBoardMapper.parUpdate(dto);
    }

    @Override
    public void answerInsert(LecBoard dto) throws Exception {
    lecBoardMapper.answerInsert(dto);
    }

    @Override
    public void lecBoardDelete(int qno) throws Exception {
    lecBoardMapper.lecBoardDelete(qno);
    }

    @Override
    public void lecBoardEdit(LecBoard dto) throws Exception {
    lecBoardMapper.lecBoardEdit(dto);
    }
}
