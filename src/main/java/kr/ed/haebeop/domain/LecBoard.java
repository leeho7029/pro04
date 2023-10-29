package kr.ed.haebeop.domain;

import lombok.Data;

@Data
public class LecBoard {
    private int qno;
    private String lcode;
    private String title;
    private String content;
    private String author;
    private String resdate;
    private int lev;
    private int par;
}
