package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Curriculum;
import kr.ed.haebeop.persistence.CurriculumMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CurriculumServiceImpl implements CurriculumService {

    @Autowired
    private CurriculumMapper curriculumMapper;

    @Override
    public List<Curriculum> curriculumList(String lcode) throws Exception {
        return curriculumMapper.curriculumList(lcode);
    }

    @Override
    public List<Curriculum> curriculumList(Page page) throws Exception {
        return curriculumMapper.curriculumListWithPage(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return curriculumMapper.getCount(page);
    }

    @Override
    public Curriculum curriculumDetail(int ccode) throws Exception {
        return curriculumMapper.curriculumDetail(ccode);
    }

    @Override
    public void curriculumInsert(List<Curriculum> curriculumList) throws Exception {
        for (Curriculum curr : curriculumList) {
            curriculumMapper.curriculumInsert(curr);
        }
    }

    @Override
    public String findLcode(int ccode) throws Exception {
        return curriculumMapper.findLcode(ccode);
    }
}
