package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.BoardVO;
import kr.ed.haebeop.domain.FilterWord;
import kr.ed.haebeop.util.FilterPage;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface FilterWordService {

    public List<FilterWord> filterList(Page page) throws Exception;
    public int getCount() throws Exception;
    public List<BoardVO> badList(FilterPage page) throws Exception;
    public int getCountBadList() throws Exception;
    public boolean filterInsert(String word) throws Exception;
    public void filterDelete(int fno) throws Exception;

}
