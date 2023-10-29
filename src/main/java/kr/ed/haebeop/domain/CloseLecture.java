package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CloseLecture {

    private String lcode;
    private String sname;
    private String lname;
    private String sdate;
    private String edate;
    private int regCnt;
    private String state;

}
