package guohao.dao;

import guohao.bean.Book;
import guohao.utils.DbConUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDao {

    private Connection conn = DbConUtil.getCon();

    /**
     * 添加书籍
     * @param book
     * @return
     * @throws SQLException
     */
    public boolean addBook(Book book) throws SQLException {
        if(book == null){
            return false;
        }

        String sql = "insert into book(book_name, author, press, borrowed_date, returned_date, is_borrowed, owner_id) "
                + "values(?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement pstmt = null;
        int i = 0;

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, book.getName());
        pstmt.setString(2, book.getAuthor());
        pstmt.setString(3, book.getPress());
        pstmt.setDate(4, new Date(book.getBorrowedDate().getTime()));
        pstmt.setDate(5, new Date(book.getReturnedDate().getTime()));
        pstmt.setInt(6, book.isBorrowed() ? 1 : 0);
        pstmt.setInt(7, book.getOwnerId());

        i = pstmt.executeUpdate();

        DbConUtil.close(null, pstmt, null, null);  //释放资源

        return i>0 ? true : false;
    }

    /**
     * 根据书籍id删除书籍
     * @param bookId
     * @return
     * @throws SQLException
     */
    public boolean deleteBook(int bookId) throws SQLException {
        if(bookId <= 0){
            return false;
        }

        String sql = "delete from book where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bookId);

        boolean result = pstmt.executeUpdate()>0 ? true : false;

        DbConUtil.close(null, pstmt, null, null);  //释放资源

        return result;
    }

    /**
     * 更新书籍信息
     * @param book
     * @return
     * @throws SQLException
     */
    public boolean updateBook(Book book) throws SQLException {
        if (book == null) {
            return false;
        }

        String sql = "update book set book_name=?, author=?, press=?, borrowed_date=?, returned_date=?, is_borrowed=?, owner_id=?"
                + " where book_id=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, book.getName());
        pstmt.setString(2, book.getAuthor());
        pstmt.setString(3, book.getPress());
        pstmt.setDate(4, new Date(book.getBorrowedDate().getTime()));
        pstmt.setDate(5, new Date(book.getReturnedDate().getTime()));
        pstmt.setInt(6, book.getOwnerId());
        pstmt.setInt(7, book.getId());

        boolean result = pstmt.executeUpdate()>0 ? true : false;

        DbConUtil.close(null, pstmt, null, null);  //释放资源

        return result;
    }

    /**
     * 根据书名查找书籍，返回List,如果List的size为0，说明图书馆没有此书
     * @param bookName
     * @return
     * @throws SQLException
     */
    public List<Book> queryBook(String bookName) throws SQLException {
        if(bookName.equals("") || bookName==null){
            return null;
        }

        List<Book> books = new ArrayList<>();

        String sql = "select * from book where book_name=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, bookName);

        ResultSet rs = pstmt.executeQuery();

        while (rs.next()){
            Book book = new Book();
            book.setId(rs.getInt("book_id"));
            book.setName(rs.getString("book_name"));
            book.setAuthor(rs.getString("author"));
            book.setPress(rs.getString("press"));
            book.setBorrowedDate(rs.getTimestamp("borrowed_date"));
            book.setReturnedDate(rs.getTimestamp("returned_date"));
            book.setBorrowed(rs.getInt("is_borrowed")==1 ? true : false);
            book.setOwnerId(rs.getInt("owner_id"));

            books.add(book);
        }

        DbConUtil.close(null, pstmt, null, rs);  //释放资源

        return books;
    }

    /**
     * 查询图书馆内所有图书信息
     * @return
     * @throws SQLException
     */
    public List<Book> queryAllBook() throws SQLException {
        List<Book> books = new ArrayList<>();

        String sql = "select * from book";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()){
            Book book = new Book();
            book.setId(rs.getInt("book_id"));
            book.setName(rs.getString("book_name"));
            book.setAuthor(rs.getString("author"));
            book.setPress(rs.getString("press"));
            book.setBorrowedDate(rs.getTimestamp("borrowed_date"));
            book.setReturnedDate(rs.getTimestamp("returned_date"));
            book.setBorrowed(rs.getInt("is_borrowed")==1 ? true : false);
            book.setOwnerId(rs.getInt("owner_id"));

            books.add(book);
        }

        DbConUtil.close(null, pstmt, null, rs);  //释放资源

        return books;
    }
}
