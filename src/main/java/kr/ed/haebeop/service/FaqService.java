package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Faq;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface FaqService {
    public List<Faq> faqList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
}
