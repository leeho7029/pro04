package kr.co.haebop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Lecture {
    private int lecno;
    private String subcode;
    private String leccode;
    private String lectitle;
    private String bkcode;
    private String stno;
    private String cate;
    private List<FileInfo3> fileInfos;
}
