package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Faq;
import kr.ed.haebeop.persistence.FaqMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaqServiceImpl implements FaqService {

    @Autowired
    private FaqMapper faqMapper;

    @Override
    public List<Faq> faqList(Page page) throws Exception {
        return faqMapper.faqList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return faqMapper.getCount(page);
    }
}
