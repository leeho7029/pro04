package kr.co.haebop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileInfo2 {
    private int no;
    private int seq;
    private String saveFolder;
    private String originFile;
    private String saveFile;
}