package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Faq;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FaqMapper {
    public List<Faq> faqList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
}
