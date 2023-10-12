package kr.co.haebop.domain;

import lombok.Data;

@Data
public class Community {

    private int cno;
    private String cate;
    private String title;
    private String content;
    private String author;
    private String resdate;
    private int cnt;

}
