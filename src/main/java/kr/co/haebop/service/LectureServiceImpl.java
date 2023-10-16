package kr.co.haebop.service;

import kr.co.haebop.domain.Lecture;
import kr.co.haebop.repository.LectureRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LectureServiceImpl implements LectureService{
    @Autowired
    LectureRepository lectureRepository;

    @Override
    public List<Lecture> lectureList() throws Exception {
        return lectureRepository.lectureList();
    }

    @Override
    public Lecture lectureDetail(int lecno) throws Exception {
        return lectureRepository.lectureDetail(lecno);
    }
    @Transactional
    @Override
    public void lectureInsert(Lecture lecture) throws Exception {
        lectureRepository.lectureInsert(lecture);
        lectureRepository.fileRegister(lecture);
    }

    @Override
    public void lectureDelete(int lecno) throws Exception {
        lectureRepository.lectureDelete(lecno);
    }

    @Override
    public void lectureEdit(Lecture lecture) throws Exception {
        lectureRepository.lectureEdit(lecture);
    }

    @Override
    public void fileRegister(Lecture lecture) throws Exception {
        lectureRepository.fileRegister(lecture);
    }

    @Override
    public Lecture lectureSelect(String leccode) throws Exception {
        return lectureRepository.lectureSelect(leccode);
    }
}
