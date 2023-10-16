package kr.co.haebop.repository;

import kr.co.haebop.domain.Book;
import kr.co.haebop.domain.Fileboard;


import java.util.List;

public interface BookRepository {
    public List<Book> bookList() throws Exception;
    public Book bookDetail(int bkno) throws Exception;
    public void bookInsert(Book book) throws Exception;
    public void bookDelete(int bkno) throws Exception;
    public void bookEdit(Book book) throws Exception;
    public void fileRegister(Book book) throws Exception;

}
