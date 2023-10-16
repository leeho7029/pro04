package kr.co.haebop.service;

import kr.co.haebop.domain.Book;
import kr.co.haebop.domain.Fileboard;

import java.util.List;

public interface BookService {
    public List<Book> bookList() throws Exception;
    public Book bookDetail(int bkno) throws Exception;
    public void bookInsert(Book book) throws Exception;
    public void bookDelete(int bkno) throws Exception;
    public void bookEdit(Book book) throws Exception;
    public void fileRegister(Book book) throws Exception;
}
