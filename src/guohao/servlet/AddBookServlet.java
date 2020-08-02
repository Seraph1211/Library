package guohao.servlet;

import guohao.bean.Book;
import guohao.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AddBookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String bookName = request.getParameter("name");
        String author = request.getParameter("author");
        String press = request.getParameter("press");
        String intro = request.getParameter("introduction");

        System.out.println("[bookName=" + bookName
                            + "\n author=" + author
                            + "\n press=" + press
                            + "\n intro=" + intro + "]");

        BookService bookService = new BookService();

        boolean result = false;
        Book book = new Book();
        book.setName(bookName);
        book.setAuthor(author);
        book.setPress(press);
        book.setIntroduction(intro);
        book.setOwnerId(0);
        book.setBorrowed(false);

        try {
            result = bookService.addBook(book);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(result){
            request.setAttribute("msg", "success");
            request.getRequestDispatcher("add_book.jsp")
                    .forward(request, response);
        }else {
            request.setAttribute("msg", "fail");
            request.getRequestDispatcher("add_book.jsp")
                    .forward(request, response);
        }

    }
}
