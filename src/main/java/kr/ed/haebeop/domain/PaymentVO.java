package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVO {
    private int pno;
    private String lcode;
    private String bcode;
    private int dno;
    private String lname;
    private String tname;
    private String bname;
    private int bprice;
    private int lprice;
    private int dstatus;
    private String title;
    private String sdate;
    private String edate;
    private String id;
    private int pt;
    private String method;
    private String com;
    private int price;
    private String account;
    private String resdate;
    private String state;
}
