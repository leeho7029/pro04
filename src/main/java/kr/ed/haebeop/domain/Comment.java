package kr.ed.haebeop.domain;

import lombok.Data;

@Data
public class Comment {
    private int comNo;
    private int seq;
    private String nickname;
    private String resdate;
    private String content;
}
