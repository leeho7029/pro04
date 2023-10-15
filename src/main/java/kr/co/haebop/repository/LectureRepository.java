package kr.co.haebop.repository;

import kr.co.haebop.domain.Lecture;


import java.util.List;

public interface LectureRepository {
    public List<Lecture> lectureList() throws Exception;
    public Lecture lectureDetail(int lecno) throws Exception;
    public void lectureInsert(Lecture lecture) throws Exception;
    public void lectureDelete(int lecno) throws Exception;
    public void lectureEdit(Lecture lecture) throws Exception;
    public void fileRegister(Lecture lecture) throws Exception;
}
