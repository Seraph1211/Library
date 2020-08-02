<%@ page import="guohao.bean.Book" %>
<%@ page import="guohao.service.BookService" %><%--
  Created by IntelliJ IDEA.
  User: Seraph
  Date: 2020/7/29
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Detail</title>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!--通过CDN引用jQuery-->
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>

</head>
<body>
    <%
        int bookId = Integer.parseInt(request.getParameter("book_id"));
        System.out.println("book_detail.jsp: book_id="+bookId);

        BookService service = new BookService();
        Book book = service.queryBook(bookId);

        if(book != null){
    %>

    <div id="header" style="padding-bottom: 80px"></div>

    <div class="col-xs-6 col-md-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">《 <%= book.getName()%>》</h3>
            </div>
            <div class="panel-body">
                <table class="table table-hover">
                    <tbody>
                    <tr>
                        <th width="15%">编号</th>
                        <td><%= book.getId()%></td>
                    </tr>
                    <tr>
                        <th width="15%">书名</th>
                        <td><%= book.getName()%></td>
                    </tr>
                    <tr>
                        <th>作者</th>
                        <td><%= book.getAuthor()%></td>
                    </tr>
                    <tr>
                        <th>出版社</th>
                        <td><%= book.getPress()%></td>
                    </tr>
                    <tr>
                        <th>简介</th>
                        <td><%= book.getIntroduction()%></td>
                    </tr>
                    <tr>
                        <th>状态</th>
                        <td><%= book.isBorrowed() ? "已借出" : "未借出"%></td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>

    </div>

    <%
        }
    %>
</body>
</html>