package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface TeacherService {
    public List<Teacher> teacherList() throws Exception;
    public List<Teacher> teacherList(Page page) throws Exception;
    public List<Teacher> findTeacher(String tname) throws Exception;
    public Teacher teacherDetail(String tcode) throws Exception;
    public Teacher teacherDetailWithname(String tname) throws Exception;
    public void teacherInsert(Teacher teacher) throws Exception;
    public void teacherEdit(Teacher teacher) throws Exception;
    public int getCount(Page page) throws Exception;
    public boolean isTeacher(String id) throws Exception;
    public String getTid(String lcode) throws Exception;

}
