package kr.co.haebop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileInfo {
    private int no;
    private int articleno;
    private String saveFolder;
    private String originFile;
    private String saveFile;
}
