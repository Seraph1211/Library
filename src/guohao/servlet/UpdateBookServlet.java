package guohao.servlet;

import guohao.bean.Book;
import guohao.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class UpdateBookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        int bookId = Integer.parseInt(request.getParameter("book_id"));
        String bookName = request.getParameter("name");
        String author = request.getParameter("author");
        String press = request.getParameter("press");
        String intro = request.getParameter("introduction");
        int isBorrowed = Integer.parseInt(request.getParameter("is_borrowed"));
        int ownerId = Integer.parseInt(request.getParameter("owner_id"));

        System.out.println("[ bookId=" + bookId
                            + " \n bookName=" + bookName
                            + ", \n author=" + author
                            + ", \n press=" + press
                            + ", \n introduction=" + intro
                            + ", \n isBorrow=" + isBorrowed
                            + ", \n ownerId=" + ownerId
                            + "] \n");


        BookService bookService = new BookService();
        boolean result = false;
        try {
            result = bookService.updateBook(bookId, bookName, author, press, intro, isBorrowed, ownerId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(result){
            request.setAttribute("result", "success");
            request.setAttribute("book_id", bookId);
            request.getRequestDispatcher("edit_book.jsp")
                    .forward(request, response);
        }else {
            request.setAttribute("result", "fail");
            request.setAttribute("book_id", bookId);
            request.getRequestDispatcher("edit_book.jsp")
                    .forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
