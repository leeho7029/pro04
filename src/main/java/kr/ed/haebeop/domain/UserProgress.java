package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserProgress {

    private String lcode;
    private String lname;
    private String lcontent;
    private String state;
    private int lecCnt;
    private int stdCnt;
    private double progress;

}
