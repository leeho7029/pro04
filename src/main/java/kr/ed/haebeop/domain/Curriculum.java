package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Curriculum {

    private int ccode;
    private String lcode;
    private String lname;
    private String cname;
    private String cvideo;

    private int scode;
    private double studyTime;
    private boolean completed;

}
