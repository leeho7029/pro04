package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
    private int pno;
    private String title;
    private String lcode;
    private String bcode;
    private String tcode;
    private String id;
    private String method;
    private String com;
    private int price;
    private String account;
    private int dno;
    private String resdate;
}
