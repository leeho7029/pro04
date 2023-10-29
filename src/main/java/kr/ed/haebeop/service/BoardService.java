package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.BoardVO;
import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.util.Page;

import java.util.List;
import java.util.Map;

public interface BoardService {
    public List<BoardVO> boardList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public int getCount() throws Exception;
    public BoardVO boardDetail(int seq) throws Exception;
    public void updateVisitedCount(int seq) throws Exception;
    public BoardVO boardRef(int seq, String type) throws Exception;
    public void boardInsert(Board dto) throws Exception;
    public void boardDelete(int seq) throws Exception;
    public void boardEdit(Board dto) throws Exception;
    public List<Category> categories() throws Exception;
    public List<Map<String, Integer>> getCateBoardCnt() throws Exception;

}
