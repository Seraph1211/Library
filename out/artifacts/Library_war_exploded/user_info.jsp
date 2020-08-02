<%@ page import="guohao.service.BookService" %>
<%@ page import="guohao.service.UserService" %>
<%@ page import="java.util.List" %>
<%@ page import="guohao.bean.Record" %>
<%@ page import="guohao.utils.UserInfoUtil" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Seraph
  Date: 2020/7/29
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Info</title>

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
                            <li><a href="book_list.jsp">Book List</a> </li>
                            <li><a href="#">Blog</a> </li>
                            <li><a href="#">Contact</a> </li>
                        </ul>

                        <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" />
                            </div>
                            <button type="submit" class="btn btn-default">Search</button>
                        </form>

<%--                        <ul class="nav navbar-nav navbar-sub  pull-right" id="ul_home_register_login">--%>
<%--                            <li><a href="register.jsp">Register</a> </li>--%>
<%--                            <li><a href="login.jsp">Login</a> </li>--%>
<%--                        </ul>--%>
<%--    --%>
                        <ul class="nav navbar-nav navbar-sub  pull-right">
                            <li class="active"><a href="#">User</a> </li>
                        </ul>

                    </div>
                </div>
            </div>

            <table class="table table-striped" style="table-layout: fixed">
                <caption>用户借阅记录</caption>
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书名</th>
                    <th>借出日期</th>
                    <th>应还日期</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                <%
                    UserService userService = new UserService();
                    List<Record> recordList = userService.getRecords(UserInfoUtil.userId);

                    if(recordList != null){


                        for(Record record: recordList){

                %>
                <tr>
                    <td><%= record.getBookId()%></td>
                    <td><%= new BookService().queryBook(record.getBookId()).getName() %></td>
                    <td><%= new SimpleDateFormat("yyyy-MM-dd").format(record.getBorrowedDate()) %></td>
                    <td><%= new SimpleDateFormat("yyyy-MM-dd").format(record.getReturnedDate()) %></td>
                    <td><%= record.isReturned() ? "已归还 " : "未归还" %></td>
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
