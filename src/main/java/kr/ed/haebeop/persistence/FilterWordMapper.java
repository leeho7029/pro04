package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.BoardVO;
import kr.ed.haebeop.domain.FilterWord;
import kr.ed.haebeop.util.FilterPage;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FilterWordMapper {
    public List<FilterWord> filterList(Page page) throws Exception;
    public List<FilterWord> filterList() throws Exception;
    public int getCount() throws Exception;
    public List<BoardVO> badList(FilterPage page) throws Exception;
    public int getCountBadList(List<FilterWord> filterList) throws Exception;
    public FilterWord filterWordDetail(String word) throws Exception;
    public void filterInsert(String word) throws Exception;
    public void filterDelete(int fno) throws  Exception;

}
