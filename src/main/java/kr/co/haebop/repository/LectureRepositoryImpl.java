package kr.co.haebop.repository;

import kr.co.haebop.domain.Lecture;
import kr.co.haebop.domain.Teacher;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LectureRepositoryImpl implements LectureRepository{
    @Autowired
    SqlSession sqlSession;

    @Override
    public List<Lecture> lectureList() throws Exception {
        return sqlSession.selectList("lecture.lectureList");
    }

    @Override
    public Lecture lectureDetail(int lecno) throws Exception {
        return sqlSession.selectOne("lecture.lectureDetail");
    }

    @Override
    public void lectureInsert(Lecture lecture) throws Exception {
        sqlSession.insert("lecture.lectureInsert",lecture);
    }

    @Override
    public void lectureDelete(int lecno) throws Exception {
        sqlSession.delete("lecture.lectureDelete",lecno);
    }

    @Override
    public void lectureEdit(Lecture lecture) throws Exception {
        sqlSession.update("lecture.lectureEdit",lecture);
    }
    @Override
    public void fileRegister(Lecture lecture) throws Exception {
        sqlSession.insert("lecture.fileRegister", lecture);
    }
}
