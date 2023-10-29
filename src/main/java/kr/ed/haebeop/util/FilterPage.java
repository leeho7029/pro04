package kr.ed.haebeop.util;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class FilterPage extends Page {
    private List<String> list;
}
