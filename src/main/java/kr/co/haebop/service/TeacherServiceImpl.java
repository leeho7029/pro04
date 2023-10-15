package kr.co.haebop.service;

import kr.co.haebop.domain.FileInfo2;
import kr.co.haebop.domain.Teacher;
import kr.co.haebop.repository.FileInfo2Repository;
import kr.co.haebop.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class TeacherServiceImpl implements TeacherService{
    @Autowired
    private TeacherRepository teacherRepository;
    @Autowired
    private FileInfo2Repository fileInfo2Repository;
    @Transactional
    @Override
    public List<Teacher> teacherList() throws Exception {
        return teacherRepository.teacherList();

    }

    @Override
    public Teacher teacherDetail(int seq) throws Exception {
        return teacherRepository.teacherDetail(seq);
    }

    @Override
    @Transactional
    public void teacherInsert(Teacher teacher) throws Exception {
        teacherRepository.teacherInsert(teacher);
      teacherRepository.fileRegister(teacher);
    }

    @Override
    public void teacherDelete(int seq) throws Exception {
        teacherRepository.teacherDelete(seq);
    }

    @Override
    @Transactional
    public void teacherEdit(Teacher teacher) throws Exception {
        teacherRepository.teacherEdit(teacher);
    }

    @Override
    public void fileRegister(Teacher teacher) throws Exception{
        teacherRepository.fileRegister(teacher);
    }
}
