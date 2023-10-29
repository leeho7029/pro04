package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Book;
import kr.ed.haebeop.domain.Delivery;
import kr.ed.haebeop.domain.Receive;
import kr.ed.haebeop.persistence.BookMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService{

    @Autowired
    private BookMapper bookMapper;

    @Override
    public List<Book> booklist() throws Exception {
        return bookMapper.booklist();
    }

    @Override
    public List<Book> bookList(Page page) throws Exception {
        return bookMapper.bookList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return bookMapper.getCount(page);
    }

    @Override
    public void bookInsert(Book book) throws Exception {
        bookMapper.bookInsert(book);
    }

    @Override
    public void receive(Receive receive) throws Exception {
        bookMapper.receive(receive);
    }

    @Override
    public void bookUpdate(Book book) throws Exception {
        bookMapper.bookUpdate(book);
    }

    @Override
    public Book bookDetail(String bcode) throws Exception {
        return bookMapper.bookDetail(bcode);
    }

    @Override
    public List<Book> findBook(String bname) throws Exception {
        return bookMapper.findBook(bname);
    }
}
