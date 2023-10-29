package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Curriculum;
import kr.ed.haebeop.domain.StudyInfo;
import kr.ed.haebeop.persistence.StudyInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudyInfoServiceImpl implements StudyInfoService {

    @Autowired
    StudyInfoMapper studyInfoMapper;

    @Override
    public List<Integer> getStudyList(String id, String lcode) throws Exception {
        Map<String, String> data = new HashMap<>();
        data.put("id", id);
        data.put("lcode", lcode);
        return studyInfoMapper.getStudyList(data);
    }

    @Override
    public StudyInfo studyInfoDetail(String id, int ccode) throws Exception {
        StudyInfo studyInfo = new StudyInfo();
        studyInfo.setId(id);
        studyInfo.setCcode(ccode);
        return studyInfoMapper.getStudyInfo(studyInfo);
    }

    @Override
    public void studyInfoInsert(StudyInfo studyInfo) throws Exception {

        if(studyInfoMapper.getStudyInfo(studyInfo) == null) {
            studyInfoMapper.studyInfoInsert(studyInfo);
        } else {
            studyInfoMapper.studyInfoEdit(studyInfo);
        }
    }

    @Override
    public Integer getCount(String id) throws Exception {
        return studyInfoMapper.getCount(id);
    }
}
