package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Lecture {

    private String lcode;
    private String lname;
    private String scode;
    private int tcode;
    private String lcontent;
    private int lprice;
    private int maxStudent;
    private String saveFile;
    private String sdate;
    private String edate;
    private String stime;
    private String state;
    private String classroom;
    private String bcode;

}
