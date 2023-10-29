package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.BoardVO;
import kr.ed.haebeop.domain.FilterWord;
import kr.ed.haebeop.persistence.FilterWordMapper;
import kr.ed.haebeop.util.FilterPage;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class FilterWordServiceImpl implements FilterWordService {

    @Autowired
    private FilterWordMapper filterWordMapper;

    @Override
    public List<FilterWord> filterList(Page page) throws Exception {
        return filterWordMapper.filterList(page);
    }

    @Override
    public int getCount() throws Exception {
        return filterWordMapper.getCount();
    }

    @Override
    public List<BoardVO> badList(FilterPage page) throws Exception {
        List<FilterWord> filterList = filterWordMapper.filterList();
        List<String> wordList = new ArrayList<>();
        for(FilterWord filter:filterList) {
            wordList.add(filter.getWord());
        }
        page.setList(wordList);
        return filterWordMapper.badList(page);
    }

    @Override
    public int getCountBadList() throws Exception {
        List<FilterWord> filterList = filterWordMapper.filterList();
        return filterWordMapper.getCountBadList(filterList);
    }

    @Override
    public boolean filterInsert(String word) throws Exception {
        boolean result = false;
        if (filterWordMapper.filterWordDetail(word) == null) {
            filterWordMapper.filterInsert(word);
            result = true;
        }
        return result;
    }

    @Override
    public void filterDelete(int fno) throws Exception {
        filterWordMapper.filterDelete(fno);
    }
}
