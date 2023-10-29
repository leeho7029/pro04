package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Teacher {

    private String tcode;
    private String tid;
    private String tname;
    private String ttel;
    private String temail;
    private String tcontent;
    private String saveFile;

}
