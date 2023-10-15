package kr.co.haebop.service;

import kr.co.haebop.domain.Teacher;

import java.util.List;

public interface TeacherService {
    public List<Teacher> teacherList() throws Exception;
    public Teacher teacherDetail(int seq) throws Exception;
    public void teacherInsert(Teacher teacher) throws Exception;
    public void teacherDelete(int seq) throws Exception;
    public void teacherEdit(Teacher teacher) throws Exception;
    public void fileRegister(Teacher teacher) throws Exception;
}
