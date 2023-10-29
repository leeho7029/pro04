package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.persistence.TeacherMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public List<Teacher> teacherList() throws Exception {
        return teacherMapper.teacherList();
    }

    @Override
    public List<Teacher> teacherList(Page page) throws Exception {
        return teacherMapper.teacherListWithPage(page);
    }

    @Override
    public List<Teacher> findTeacher(String tname) throws Exception {
        return teacherMapper.findTeacher(tname);
    }

    @Override
    public Teacher teacherDetail(String tcode) throws Exception {
        return teacherMapper.teacherDetail(tcode);
    }

    @Override
    public Teacher teacherDetailWithname(String tname) throws Exception {
        return teacherMapper.teacherDetailWithname(tname);
    }

    @Override
    public void teacherInsert(Teacher teacher) throws Exception {
        teacherMapper.teacherInsert(teacher);
    }

    @Override
    public void teacherEdit(Teacher teacher) throws Exception {
        teacherMapper.teacherEdit(teacher);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return teacherMapper.getCount(page);
    }

    @Override
    public boolean isTeacher(String id) throws Exception {
        if(teacherMapper.isTeacher(id) > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public String getTid(String lcode) throws Exception {
        return teacherMapper.getTid(lcode);
    }
}
