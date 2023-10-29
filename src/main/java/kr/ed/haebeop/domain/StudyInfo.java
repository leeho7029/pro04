package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudyInfo {

    private int scode;
    private int ccode;
    private String id;
    private double studyTime;
    private boolean completed;

}
