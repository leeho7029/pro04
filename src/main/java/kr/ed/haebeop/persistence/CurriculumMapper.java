package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Curriculum;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CurriculumMapper {

    public List<Curriculum> curriculumList(String lcode) throws Exception;
    public List<Curriculum> curriculumListWithPage(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public Curriculum curriculumDetail(int ccode) throws Exception;
    public void curriculumInsert(Curriculum curriculum) throws Exception;
    public String findLcode(int ccode) throws Exception;


}
