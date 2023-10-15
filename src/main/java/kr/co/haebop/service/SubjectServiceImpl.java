package kr.co.haebop.service;

import kr.co.haebop.domain.Subject;
import kr.co.haebop.repository.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService{
    @Autowired
    SubjectRepository subjectRepository;

    @Override
    public List<Subject> subjectList() throws Exception {
        return subjectRepository.subjectList();
    }

    @Override
    public Subject subjectDetail(int subno) throws Exception {
        return subjectRepository.subjectDetail(subno);
    }

    @Override
    public void subjectInsert(Subject subject) throws Exception {
        subjectRepository.subjectInsert(subject);
    }

    @Override
    public void subjectDelete(int subno) throws Exception {
        subjectRepository.subjectDelete(subno);
    }
}
