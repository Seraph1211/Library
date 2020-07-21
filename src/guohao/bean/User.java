package guohao.bean;

import java.util.List;

public class User {
    private int id;  //用户id(仅后台可见)
    private String name;  //用户名
    private String pwd;  //密码
    private List<Book> borrowedBooks;  //已借且未归还的书籍
    private List<Book> returnedBooks;  //已借且已归还的书籍


    public User(){

    }

    public User(String name, String pwd){
        this.name = name;
        this.pwd = pwd;
    }


    // getter & setter
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Book> getBorrowedBooks() {
        return borrowedBooks;
    }

    public void setBorrowedBooks(List<Book> borrowedBooks) {
        this.borrowedBooks = borrowedBooks;
    }

    public List<Book> getReturnedBooks() {
        return returnedBooks;
    }

    public void setReturnedBooks(List<Book> returnedBooks) {
        this.returnedBooks = returnedBooks;
    }
}
