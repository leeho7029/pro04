package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.BoardVO;
import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.persistence.BoardMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public List<BoardVO> boardList(Page page) throws Exception {
        return boardMapper.boardList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return boardMapper.getCountWithPage(page);
    }

    @Override
    public int getCount() throws Exception {
        return boardMapper.getCount();
    }

    @Override
    public BoardVO boardDetail(int seq) throws Exception {
        return boardMapper.boardDetail(seq);
    }

    @Override
    public void updateVisitedCount(int seq) throws Exception {
        boardMapper.countUp(seq);
    }

    @Override
    public BoardVO boardRef(int seq, String type) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("seq", seq);
        data.put("type", type);
        return boardMapper.boardRef(data);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        boardMapper.boardInsert(dto);
    }

    @Override
    public void boardDelete(int seq) throws Exception {
        boardMapper.boardDelete(seq);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        boardMapper.boardEdit(dto);
    }

    @Override
    public List<Category> categories() throws Exception {
        return boardMapper.categories();
    }

    @Override
    public List<Map<String, Integer>> getCateBoardCnt() throws Exception {
        return boardMapper.getCateBoardCnt();
    }

}
