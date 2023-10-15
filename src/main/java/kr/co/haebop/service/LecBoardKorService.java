package kr.co.haebop.service;

import kr.co.haebop.domain.LecBoardKor;

import java.util.List;

public interface LecBoardKorService {
    public List<LecBoardKor> LecBoardKorList() throws Exception;
    public LecBoardKor LecBoardKorDetail(int seq) throws Exception;
    public void LecBoardKorInsert(LecBoardKor LecBoardKor) throws Exception;
    public void LecBoardKorDelete(int seq) throws Exception;
    public void LecBoardKorEdit(LecBoardKor lecBoardKor) throws Exception;
}
