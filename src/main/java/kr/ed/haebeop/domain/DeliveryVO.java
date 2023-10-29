package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeliveryVO {
    private int pno;
    private String title;
    private String id;
    private String name;
    private String addr;
    private String resdate;
    private int dstatus;
    private String dcom;
    private String dtel;
    private String ddate;
    private String edate;
    private String dcode;
    private int dno;
    private String tel;
}
