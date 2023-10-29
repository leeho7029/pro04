package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Curriculum;
import kr.ed.haebeop.domain.StudyInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface StudyInfoMapper {

    public void studyInfoInsert(StudyInfo studyInfo) throws Exception;
    public void studyInfoEdit(StudyInfo studyInfo) throws Exception;
    public List<Integer> getStudyList(Map<String, String> data) throws Exception;
    public StudyInfo getStudyInfo(StudyInfo studyInfo) throws Exception;
    public Integer getCount(String id) throws Exception;
}
