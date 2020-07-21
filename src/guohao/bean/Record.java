package guohao.bean;

public class Record {
    private int bookId;  //书籍Id
    private int userId;  //用户Id
    private boolean isReturned;  //是否已归还

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
}
