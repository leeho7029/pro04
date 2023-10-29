package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TeacherMapper {
    public List<Teacher> teacherList() throws Exception;
    public List<Teacher> teacherListWithPage(Page page) throws Exception;
    public List<Teacher> findTeacher(String tname) throws Exception;
    public Teacher teacherDetail(String tcode) throws Exception;
    public Teacher teacherDetailWithname(String tname) throws Exception;
    public void teacherInsert(Teacher teacher) throws Exception;
    public void teacherEdit(Teacher teacher) throws Exception;
    public int getCount(Page page) throws Exception;
    public int isTeacher(String id) throws Exception;
    public String getTid(String lcode) throws Exception;

}
