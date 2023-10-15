package kr.co.haebop.repository;

import kr.co.haebop.domain.Book;
import kr.co.haebop.domain.Fileboard;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class BookRepositoryImpl implements BookRepository{
    @Autowired
    SqlSession sqlSession;

    @Override
    public List<Book> bookList() throws Exception {
        return sqlSession.selectList("book.bookList");
    }

    @Override
    public Book bookDetail(int no) throws Exception {
        return sqlSession.selectOne("book.bookDetail",no);
    }

    @Override
    public void bookInsert(Book book) throws Exception {
        sqlSession.insert("book.bookInsert",book);
    }

    @Override
    public void bookDelete(int no) throws Exception {
        sqlSession.delete("book.bookDelte",no);
    }

    @Override
    public void bookEdit(Book book) throws Exception {
        sqlSession.update("book.bookEdit",book);
    }

    @Override
    public void fileRegister(Book book) throws Exception {
        sqlSession.insert("book.fileRegister",book);
    }
}
