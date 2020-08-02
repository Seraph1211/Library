package guohao.dao;

import guohao.bean.Book;
import guohao.bean.Record;
import guohao.bean.User;
import guohao.service.BookService;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class DaoTest {
        public static void main(String[] args) throws SQLException {

//            BookDao bookDao = new BookDao();
//            List<Book> bookList = bookDao.queryAllBook();
//
//            for (Book book: bookList){
//                System.out.println("book_name: "+book.getName());
//                System.out.println("author: "+book.getAuthor());
//                System.out.println("introduction: "+book.getIntroduction());
//            }
//
//            UserDao userDao = new UserDao();
            //List<User> userList = userDao.qu


//            RecordDao recordDao = new RecordDao();
//
//            recordDao.updateRecord(3, 1, true);
//
//            List<Record> recordList = recordDao.queryAllRecord();
//
//            for(Record record : recordList){
//                System.out.println("[book_id=" + record.getBookId() + ", user_id="
//                        + record.getUserId() + ", is_returned="+record.isReturned()+"]");
//            }

//            Timestamp timestamp = new Timestamp(new Date().getTime());
//
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//
//            String date = sdf.format(timestamp);
//
//            System.out.println(timestamp.getTime());
//            System.out.println(timestamp);
//            System.out.println(date);

            Book book = new BookService().queryBook(2);
            System.out.println("bookName="+book.getName());
    }
}
