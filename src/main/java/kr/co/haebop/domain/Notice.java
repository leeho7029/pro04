package kr.co.haebop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
    private int seq;
    private String title;
    private String content;
    private String id;
    private String regdate;
    private int visited;
}
