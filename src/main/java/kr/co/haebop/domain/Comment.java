package kr.co.haebop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    private int comNo;
    private int cno;
    private String author;
    private String resdate;
    private String content;
}
