package kr.co.haebop.service;

import kr.co.haebop.domain.Notice;
import kr.co.haebop.util.Page;

import java.util.List;

public interface NoticeService {
    public List<Notice> noticeList() throws Exception;
    public Notice noticeDetail(int seq) throws Exception;
    public void noticeInsert(Notice notice) throws Exception;
    public void noticeDelete(int seq) throws Exception;
    public void noticeEdit(Notice notice) throws Exception;
}
