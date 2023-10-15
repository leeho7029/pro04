package kr.co.haebop.repository;

import kr.co.haebop.domain.Teacher;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public class TeacherRepositoryImpl implements TeacherRepository{
    @Autowired
    SqlSession sqlSession;

    @Override
    public List<Teacher> teacherList() throws Exception {
        return sqlSession.selectList("teacher.teacherList");
    }

    @Override
    public Teacher teacherDetail(int seq) throws Exception {
        return sqlSession.selectOne("teacher.teacherDetail",seq);
    }

    @Override
    public void fileRegister(Teacher teacher) throws Exception {
        sqlSession.insert("teacher.fileRegister", teacher);
    }

    @Override
    public void teacherInsert(Teacher teacher) throws Exception {
        sqlSession.insert("teacher.teacherInsert",teacher);
    }

    @Override
    public void teacherDelete(int seq) throws Exception {
        sqlSession.delete("teacher.teacherDelete",seq);
    }

    @Override
    public void teacherEdit(Teacher teacher) throws Exception {
        sqlSession.update("teacher.teacherEdit",teacher);
    }
}
