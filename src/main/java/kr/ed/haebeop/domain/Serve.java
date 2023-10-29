package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Serve {
    private int sno;
    private String bcode;
    private int pno;
    private String sprice;
    private String amount;
    private String resdate;
}
