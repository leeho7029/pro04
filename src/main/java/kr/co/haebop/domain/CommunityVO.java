package kr.co.haebop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommunityVO {

    private int cno;
    private String cateName;
    private String title;
    private String content;
    private String author;
    private String resdate;
    private int cnt;

}
