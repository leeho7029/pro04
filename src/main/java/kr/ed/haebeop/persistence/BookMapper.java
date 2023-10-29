package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Book;
import kr.ed.haebeop.domain.Receive;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {
    public List<Book> booklist() throws Exception;
    public List<Book> bookList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public void bookInsert(Book book) throws Exception;
    public void receive(Receive receive)throws Exception;
    public void bookUpdate(Book book) throws Exception;
    public Book bookDetail(String bcode) throws Exception;
    public List<Book> findBook(String bname) throws Exception;
}
