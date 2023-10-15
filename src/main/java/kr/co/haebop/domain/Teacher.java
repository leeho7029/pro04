package kr.co.haebop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Teacher {
    private int seq;
    private String tname;
    private String ttel;
    private String tmail;
    private String regdate;
    private List<FileInfo2> fileInfos; //첨부된 파일 정보
}
