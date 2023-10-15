package kr.co.haebop.repository;

import kr.co.haebop.domain.Notice;
import kr.co.haebop.domain.Subject;

import java.util.List;

public interface SubjectRepository {
    public List<Subject> subjectList() throws Exception;
    public Subject subjectDetail(int subno) throws Exception;
    public void subjectInsert(Subject subject) throws Exception;
    public void subjectDelete(int subno) throws Exception;
}
