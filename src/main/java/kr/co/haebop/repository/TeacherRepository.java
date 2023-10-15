package kr.co.haebop.repository;

import kr.co.haebop.domain.FileInfo2;
import kr.co.haebop.domain.Fileboard;
import kr.co.haebop.domain.Teacher;

import java.util.List;

public interface TeacherRepository {
    public List<Teacher> teacherList() throws Exception;
    public void fileRegister(Teacher teacher) throws Exception;
    public Teacher teacherDetail(int seq) throws Exception;
    public void teacherInsert(Teacher teacher) throws Exception;
    public void teacherDelete(int seq) throws Exception;
    public void teacherEdit(Teacher teacher) throws Exception;
}
