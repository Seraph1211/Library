<%@ page import="guohao.utils.UserInfoUtil" %>
<%@ page import="guohao.bean.Book" %>
<%@ page import="guohao.service.BookService" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Seraph
  Date: 2020/7/27
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book List</title>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!--通过CDN引用jQuery-->
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

    <%
        if(UserInfoUtil.userType == 1){  //普通用户
    %>
    <script>
        $(function () {
            $("#ul_book_list_register_login").hide();
            $("#ul_book_list_user").show();
            $("#ul_book_list_admin").hide();
        })
    </script>
    <%
        }else if(UserInfoUtil.userType == 0){
    %>
    <script>
        $(function () {
            $("#ul_book_list_register_login").hide();
            $("#ul_book_list_user").hide();
            $("#ul_book_list_admin").show();
        })
    </script>
    <%
    }else {
    %>
    <script>
        $(function () {
            $("#ul_book_list_register_login").show();
            $("#ul_book_list_user").hide();
            $("#ul_book_list_admin").hide();
        })
    </script>
    <%
        }
    %>

    <div class="container">
        <div class="row clearfix">
            <div class="navbar navbar-inverse navbar-static-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse" data-target="#navbar"
                                aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">LIBRARY</a>
                    </div>
                    <div id="navbar" class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li ><a href="index.jsp">Home</a> </li>
                            <li><a href="#">About</a> </li>
                            <li class="active"><a href="#">Book List</a> </li>
                            <li><a href="#">Blog</a> </li>
                            <li><a href="#">Contact</a> </li>
                        </ul>

                        <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" />
                            </div>
                            <button type="submit" class="btn btn-default">Search</button>
                        </form>

                        <ul class="nav navbar-nav navbar-sub  pull-right" id="ul_book_list_register_login">
                            <li><a href="register.jsp">Register</a> </li>
                            <li><a href="login.jsp">Login</a> </li>
                        </ul>

                        <ul class="nav navbar-nav navbar-sub  pull-right" id="ul_book_list_user">
                            <li><a href="user_info.jsp">User</a> </li>
                        </ul>

                        <ul class="nav navbar-nav navbar-sub  pull-right" id="ul_book_list_admin">
                            <li><a href="user_info.jsp">Admin</a> </li>
                        </ul>

                    </div>
                </div>
            </div>

            <table class="table table-striped" style="table-layout: fixed">
                <caption>图书列表</caption>
                <thead>
                    <tr>
                        <th>书籍编号</th>
                        <th>书名</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th style="width: 700px">简介</th>
                        <th>状态</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        BookService bookService = new BookService();
                        List<Book> bookList = bookService.getAllBooks();
                        if(bookList != null){


                            for(Book book : bookList){

                    %>
                    <tr>
                        <td><%= book.getId()%></td>
                        <td><%= book.getName() %></td>
                        <td><%= book.getAuthor() %></td>
                        <td><%= book.getPress() %></td>
                        <td><%= book.getIntroduction() %></td>
                        <td><%= book.isBorrowed() ? "已借出" : "未借出" %></td>
                    </tr>
                    <%
                            }
                        }

                    %>

                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
