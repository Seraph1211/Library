package guohao.service;

import guohao.bean.Book;
import guohao.bean.Record;
import guohao.dao.BookDao;
import guohao.dao.RecordDao;

import java.sql.SQLException;
import java.util.List;
import java.util.function.BinaryOperator;

/*
用户: 浏览所有图书信息
      查看自己的借书信息

管理员：浏览所有图书信息
        查看所有用户的借书信息
        修改图书信息
 */

public class BookService {
    BookDao bookDao = new BookDao();
    RecordDao recordDao = new RecordDao();

    /**
     * 获取所有图书
     * @return
     */
    public List<Book> getAllBooks() throws SQLException {
        return bookDao.queryAllBook();
    }

    /**
     * 根据书名查询书籍信息
     * @param bookName
     * @return
     */
    public Book queryBook(String bookName) throws SQLException {
        List<Book> bookList = bookDao.queryBook(bookName);
        if(bookList == null){
            return null;
        }

        return bookList.get(0);
    }

    public Book queryBook(int bookId) throws SQLException {

        return bookDao.queryBookById(bookId);
    }

    /**
     * 根据书名更新书籍信息
     * @param bookName
     * @return
     */
    public boolean updateBook(int bookId, String bookName, String author, String press, String intro, int isBorrowed, int ownerId) throws SQLException {
        if(bookName.equals("") || bookName==null){
            return false;
        }

        Book book = new Book();

        book.setId(bookId);
        book.setName(bookName);
        book.setAuthor(author);
        book.setPress(press);
        book.setIntroduction(intro);
        book.setBorrowed(isBorrowed==1 ? true : false);
        book.setOwnerId(ownerId);

        boolean result1 = bookDao.updateBook(book);

        boolean result2 = true;

        if(book.isBorrowed()){
            Record record = recordDao.queryRecord(bookId, ownerId);

            if (record == null){
                result2 = recordDao.addRecord(bookId, ownerId, false);
            }

            result2 = recordDao.updateRecord(bookId, ownerId, isBorrowed==1 ? false : true);
        }

        return result1 && result2;
    }

    public boolean addBook(Book book) throws SQLException {
        if(book == null){
            return false;
        }

        return bookDao.addBook(book);
    }

    public boolean deleteBook(int bookId) throws SQLException {
        if(bookId <= 0){
            return false;
        }

        return bookDao.deleteBook(bookId);
    }

}
