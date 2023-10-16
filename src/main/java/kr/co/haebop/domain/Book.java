package kr.co.haebop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Book {
    private int bkno;
    private String bkcode;
    private String bktitle;
    private String bindex;
    private String regdate;
    private String pubdate;
    private String author;
    private String price;
    private String memo;
    private List<FileInfo4> fileInfos;
}
