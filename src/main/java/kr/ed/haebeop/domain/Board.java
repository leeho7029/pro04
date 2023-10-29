package kr.ed.haebeop.domain;

import lombok.Data;

@Data
public class Board {
    private int seq;
    private String cate;
    private String title;
    private String content;
    private String nickname;
    private String regdate;
    private int visited;
}
