package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Curriculum;
import kr.ed.haebeop.domain.StudyInfo;

import java.util.List;
import java.util.Map;

public interface StudyInfoService {

    public List<Integer> getStudyList(String id, String lcode) throws Exception;
    public StudyInfo studyInfoDetail(String id, int ccode) throws Exception;
    public void studyInfoInsert(StudyInfo studyInfo) throws Exception;
    public Integer getCount(String id) throws Exception;
}
