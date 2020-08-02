package guohao.bean;

import java.sql.Timestamp;

public class Record {
    private int bookId;  //书籍Id
    private int userId;  //用户Id
    private boolean isReturned;  //是否已归还
    private Timestamp borrowedDate;  //借出日期
    private Timestamp returnedDate;  //应归还日期

    public Record(){

    }

    public Record(int bookId, int userId, boolean isReturned){
        this.bookId = bookId;
        this.userId = userId;
        this.isReturned = isReturned;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public boolean isReturned() {
        return isReturned;
    }

    public void setReturned(boolean returned) {
        isReturned = returned;
    }

    public Timestamp getBorrowedDate() {
        return borrowedDate;
    }

    public void setBorrowedDate(Timestamp borrowedDate) {
        this.borrowedDate = borrowedDate;
    }

    public Timestamp getReturnedDate() {
        return returnedDate;
    }

    public void setReturnedDate(Timestamp returnedDate) {
        this.returnedDate = returnedDate;
    }
}
