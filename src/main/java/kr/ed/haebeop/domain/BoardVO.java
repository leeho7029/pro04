package kr.ed.haebeop.domain;

import lombok.Data;

@Data
public class BoardVO {
    private int seq;
    private String cateName;
    private String title;
    private String content;
    private String nickname;
    private String regdate;
    private int visited;
}
