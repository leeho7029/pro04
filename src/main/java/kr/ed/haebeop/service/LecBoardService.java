package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.LecBoard;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface LecBoardService {
    public List<LecBoard> lecBoardList(Page page) throws Exception;
    public List<LecBoard> noAnswerList(Page page) throws Exception;
    public LecBoard lecBoardDetail(int qno) throws Exception;
    public LecBoard lecBoardRef(int qno, String type) throws Exception;
    public int getCount(Page page) throws Exception;
    public int noAnswerCount(Page page) throws Exception;
    public int noAnswerCount() throws Exception;
    public void questionInsert(LecBoard dto) throws Exception;
    public void parUpdate(LecBoard dto) throws Exception;
    public void answerInsert(LecBoard dto) throws Exception;
    public void lecBoardDelete(int qno) throws Exception;
    public void lecBoardEdit(LecBoard dto) throws Exception;
}
