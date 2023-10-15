package kr.co.haebop.service;

import kr.co.haebop.domain.LecBoardKor;
import kr.co.haebop.repository.LecBoardKorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LecBoardKorServiceImpl implements LecBoardKorService{
    @Autowired
    private LecBoardKorRepository lecBoardKorRepository;

    @Override
    public List<LecBoardKor> LecBoardKorList() throws Exception {
        return lecBoardKorRepository.LecBoardKorList();
    }

    @Override
    public LecBoardKor LecBoardKorDetail(int seq) throws Exception {
        return lecBoardKorRepository.LecBoardKorDetail(seq);
    }

    @Override
    public void LecBoardKorInsert(LecBoardKor LecBoardKor) throws Exception {
        lecBoardKorRepository.LecBoardKorInsert(LecBoardKor);
    }

    @Override
    public void LecBoardKorDelete(int seq) throws Exception {
        lecBoardKorRepository.LecBoardKorDelete(seq);
    }

    @Override
    public void LecBoardKorEdit(LecBoardKor LecBoardKor) throws Exception {
        lecBoardKorRepository.LecBoardKorEdit(LecBoardKor);
    }
}
