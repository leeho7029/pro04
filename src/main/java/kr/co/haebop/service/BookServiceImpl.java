package kr.co.haebop.service;

import kr.co.haebop.domain.Book;
import kr.co.haebop.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    BookRepository bookRepository;

    @Override
    public List<Book> bookList() throws Exception {
        return bookRepository.bookList();
    }

    @Override
    public Book bookDetail(int no) throws Exception {
        return bookRepository.bookDetail(no);
    }

    @Override
    public void bookInsert(Book book) throws Exception {
        bookRepository.bookInsert(book);
    }

    @Override
    public void bookDelete(int no) throws Exception {
        bookRepository.bookDelete(no);
    }

    @Override
    public void bookEdit(Book book) throws Exception {
        bookRepository.bookEdit(book);
    }

    @Override
    public void fileRegister(Book book) throws Exception {
        bookRepository.fileRegister(book);
    }
}
