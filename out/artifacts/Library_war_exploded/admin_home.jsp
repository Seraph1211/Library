<%@ page import="guohao.bean.Book" %>
<%@ page import="guohao.service.BookService" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Seraph
  Date: 2020/7/29
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!--通过CDN引用jQuery-->
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                        <a class="navbar-brand" href="#">Admin</a>
                    </div>

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active">
                                <a href="#">All Books</a>
                            </li>
                            <li>
                                <a href="add_book.jsp">Add Book</a>
                            </li>
                        </ul>
                        <form class="navbar-form navbar-left col-md-offset-10 col-lg-offset-4col-xl-offset-8" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" />
                            </div> <button type="submit" class="btn btn-default">Search</button>
                        </form>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#">Logout</a>
                            </li>
                        </ul>
                    </div>

                </nav>


                <%
                    BookService bookService = new BookService();
                    List<Book> books = bookService.getAllBooks();
                %>


                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color: #fff">
                        <h3 class="panel-title">
                            全部图书
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>书名</th>
                                <th>作者</th>
                                <th>出版社</th>
                                <th>状态</th>
                                <th>详情</th>
                                <th>编辑</th>
                                <th>删除</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if(books!=null && books.size()>0){
                                    for(Book book : books){
                            %>
                                <tr>
                                    <td><%= book.getId()%></td>
                                    <td><%= book.getName()%></td>
                                    <td><%= book.getAuthor()%></td>
                                    <td><%= book.getPress()%></td>
                                    <td><%= book.isBorrowed() ? "已借出" : "未借出"%></td>
                                    <td><a href="book_detail.jsp?book_id=<%= book.getId()%>">
                                        <button type="button" class="btn btn-success btn-xs">详情</button>
                                    </a></td>
                                    <td><a href="edit_book.jsp?book_id=<%= book.getId()%>"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
                                    <td><a href="delete_book.jsp?book_id=<%= book.getId()%>"><button type="button" class="btn btn-danger btn-xs" >删除</button></a></td>
                                </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
