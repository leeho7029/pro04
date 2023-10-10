package kr.co.haebop.service;

import kr.co.haebop.domain.Notice;
import kr.co.haebop.repository.NoticeRepository;
import kr.co.haebop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{
    @Autowired
    private NoticeRepository noticeRepository;
    @Override
    public List<Notice> noticeList() throws Exception {
        return noticeRepository.noticeList();
    }

    @Override
    public Notice noticeDetail(int seq) throws Exception {
        return noticeRepository.noticeDetail(seq);
    }

    @Override
    public void noticeInsert(Notice notice) throws Exception {
        noticeRepository.noticeInsert(notice);
    }

    @Override
    public void noticeDelete(int seq) throws Exception {
        noticeRepository.noticeDelete(seq);
    }

    @Override
    public void noticeEdit(Notice notice) throws Exception {
        noticeRepository.noticeEdit(notice);
    }
}
