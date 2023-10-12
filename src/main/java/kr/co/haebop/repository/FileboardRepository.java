package kr.co.haebop.repository;

import kr.co.haebop.domain.Fileboard;

import java.util.List;

public interface FileboardRepository {
    public void writeArticle(Fileboard fileboard) throws Exception;
    public void fileRegister(Fileboard fileboard) throws Exception;
    public List<Fileboard> fileList() throws Exception;
    public Fileboard fileDetail(int articleno) throws Exception;

    public void fileboardDelete(int articleno) throws Exception;
    public void fileboardEdit(Fileboard dto) throws Exception;
}
