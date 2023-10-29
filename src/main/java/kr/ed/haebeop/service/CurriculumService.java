package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Curriculum;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface CurriculumService {

    public List<Curriculum> curriculumList(String lcode) throws Exception;
    public List<Curriculum> curriculumList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public Curriculum curriculumDetail(int ccode) throws Exception;
    public void curriculumInsert(List<Curriculum> curriculumList) throws Exception;
    public String findLcode(int ccode) throws Exception;

}
