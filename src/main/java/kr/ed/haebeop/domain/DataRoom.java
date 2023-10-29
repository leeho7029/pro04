package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DataRoom {
    private int articleNo;
    private String id;
    private String title;
    private String content;
    private String regdate;
    private List<FileInfo> fileInfoList;
}
