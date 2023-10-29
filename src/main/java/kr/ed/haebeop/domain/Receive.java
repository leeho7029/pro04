package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Receive {
    private int rno;
    private String bcode;
    private int amount;
    private int rprice;
    private String resdate;
}
