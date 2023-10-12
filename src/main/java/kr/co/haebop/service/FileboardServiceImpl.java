package kr.co.haebop.service;

import kr.co.haebop.domain.Fileboard;
import kr.co.haebop.repository.FileInfoRepository;
import kr.co.haebop.repository.FileboardRepository;
import kr.co.haebop.repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FileboardServiceImpl implements FileboardService{
    @Autowired
    private FileboardRepository fileboardRepository;
    @Autowired
    private FileInfoRepository fileInfoRepository;
    @Override
    @Transactional
    public void writeArticle(Fileboard fileboardDto) throws Exception {
        if(fileboardDto.getTitle() == null || fileboardDto.getContent() == null) {
            throw new Exception();
        }
        fileboardRepository.writeArticle(fileboardDto);
        fileboardRepository.fileRegister(fileboardDto);
    }

    @Override
    public void fileRegister(Fileboard fileboardDto) throws Exception {
        fileboardRepository.fileRegister(fileboardDto );
    }

    @Override
    public List<Fileboard> fileList() throws Exception {
        return  fileboardRepository.fileList();
    }

    @Override
    public Fileboard fileDetail(int articleno) throws Exception {
        return  fileboardRepository.fileDetail(articleno);
    }

    @Override
    public void fileboardDelete(int articleno) throws Exception {
        fileboardRepository.fileboardDelete(articleno);
    }

    @Transactional
    @Override
    public void fileboardEdit(Fileboard dto) throws Exception {
        fileboardRepository.fileboardEdit(dto);
        if(dto.getFileInfos().get(0).getSaveFolder() != null) {
            fileInfoRepository.fileInfoDelete(dto.getArticleno());
            fileInfoRepository.fileInfoInsert(dto);
        }
    }
}
