package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Delivery {
    private int dno;
    private int pno;
    private String id;
    private String addr;
    private String tel;
    private String dcom;
    private String dtel;
    private int dstatus;
    private String ddate;
    private String edate;
    private String dcode;
}
