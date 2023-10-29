package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.Register;
import kr.ed.haebeop.domain.UserProgress;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface RegisterService {

    public boolean isReg(String lcode, String id) throws Exception;
    public String registerInsert(String id, String lcode) throws Exception;
    public int isPeriod(String lcode) throws Exception;
    public List<LectureVO> myLectures(Page page) throws Exception;
    public List<UserProgress> progressList(String id) throws Exception;
    public int calcProfitPt() throws Exception;
    public double calcRegPercent() throws Exception;
    public int getMyCount(String id) throws Exception;
    public List<LectureVO> ongoingMyLecture(String id) throws Exception;
    public int getCount(Page page) throws Exception;
    public void registerInsert2(Register register) throws Exception;

}
