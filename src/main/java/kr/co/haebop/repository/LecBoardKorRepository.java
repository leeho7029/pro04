package kr.co.haebop.repository;

import kr.co.haebop.domain.LecBoardKor;
import kr.co.haebop.domain.Lecture;
import kr.co.haebop.domain.Teacher;

import java.util.List;

public interface LecBoardKorRepository {
    public List<LecBoardKor> LecBoardKorList() throws Exception;
    public LecBoardKor LecBoardKorDetail(int seq) throws Exception;
    public void LecBoardKorInsert(LecBoardKor LecBoardKor) throws Exception;
    public void LecBoardKorDelete(int seq) throws Exception;
    public void LecBoardKorEdit(LecBoardKor LecBoardKor) throws Exception;

}
