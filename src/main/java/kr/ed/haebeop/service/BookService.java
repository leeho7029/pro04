package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Book;
import kr.ed.haebeop.domain.Delivery;
import kr.ed.haebeop.domain.Receive;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface BookService {
    public List<Book> booklist() throws Exception;
    public List<Book> bookList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public void bookInsert(Book book) throws Exception;
    public void receive(Receive receive)throws Exception;
    public void bookUpdate(Book book) throws Exception;
    public Book bookDetail (String bcode) throws Exception;
    public List<Book> findBook(String bname) throws Exception;
}
