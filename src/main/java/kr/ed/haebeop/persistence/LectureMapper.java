package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface LectureMapper {
    public List<LectureVO> lastList() throws Exception;
    public List<LectureVO> newList() throws Exception;
    public List<LectureVO> lectureList(Page page) throws Exception;
    public LectureVO lectureDetail(String lcode) throws Exception;
    public void lectureInsert(Lecture dto) throws Exception;
    public List<CloseLecture> closeList(Page page) throws Exception;
    public int getCloseCount() throws Exception;
    public void closeLecture(Map<String, String> data) throws Exception;
    public void lectureEdit(Lecture dto) throws Exception;
    public int getCount(Page page) throws Exception;
    public int lectureCount() throws Exception;
    public List<Subject> subjects() throws Exception;
    public boolean comparePeriod(String lcode) throws Exception;
    public List<LectureVO> popularLectureList() throws Exception;
    public List<LectureVO> stateLectureList(String state) throws Exception;
}
