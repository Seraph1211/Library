package guohao.bean;


import java.sql.Timestamp;

public class Book {
    private int id;  //书籍id(仅后台可见)
    private String name;  //书籍名称
    private String author;  //作者
    private String press;  //出版社
    private String introduction;  //书籍简介
    private boolean isBorrowed;  //是否已借出
    private int ownerId;  //现书本持有者id

    public Book(){

    }


    //getter & setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getIntroduction(){
        return this.introduction;
    }

    public void setIntroduction(String introduction){
        this.introduction = introduction;
    }


    public boolean isBorrowed() {
        return isBorrowed;
    }

    public void setBorrowed(boolean borrowed) {
        isBorrowed = borrowed;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }


}
