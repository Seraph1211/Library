<%@ page import="guohao.service.BookService" %>
<%@ page import="guohao.bean.Book" %><%--
  Created by IntelliJ IDEA.
  User: Seraph
  Date: 2020/8/1
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Book</title>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!--通过CDN引用jQuery-->
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>

    <style>
        .input-group{
            margin-top: 10px;
        }
    </style>

</head>
<body>

    <%
        Object result = request.getParameter("result");
        System.out.println("edit_book.jsp: result==null? " + result==null);

        if(result == null){
            result = "";
        }

        System.out.println("edit_book.jsp: result="+result);


        if(!result.equals("")){
    %>

    <script>
        alert("<%= result%>");
    </script>

    <%
        }
    %>

    <div class="container">
        <div class="row clearfix">

            <div id="header" style="padding-bottom: 80px"></div>

            <%
                int bookId = Integer.parseInt(request.getParameter("book_id"));
                System.out.println("edit_book.jsp: book_id="+bookId);

                BookService service = new BookService();
                Book book = service.queryBook(bookId);

                if(book != null){
            %>

            <div class="col-xs-6 col-md-offset-3" style="position: relative;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">编辑《 <%= book.getName()%>》</h3>
                    </div>
                    <div class="panel-body">
                        <form action="http://localhost:8080/Library/UpdateBookServlet" method="get" >

                            <input style="visibility: hidden" type="text" class="form-control" name="book_id" value="<%= book.getId()%>">

                            <div class="input-group">
                                <span  class="input-group-addon">书名</span>
                                <input type="text" class="form-control" name="name" id="name" value="<%= book.getName()%>">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">作者</span>
                                <input type="text" class="form-control" name="author" id="author" value="<%= book.getAuthor()%>" >
                            </div>
                            <div class="input-group">
                                <span  class="input-group-addon">出版社</span>
                                <input type="text" class="form-control" name="press" id="press"  value="<%= book.getPress()%>" >
                            </div>

                            <div class="input-group">
                                <span  class="input-group-addon">简介</span>
                                <textarea class="form-control" rows="5" name="introduction" id="introduction"><%= book.getIntroduction()%></textarea>
                            </div>

                            <div class="input-group">
                                <span class="input-group-addon">是否已借出</span>
                                <div class="radio-inline" style="margin-left: 10px">
                                    <label >
                                        <input type="radio" name="is_borrowed" id="optionsRadios1" value="1" checked> 已借出
                                    </label>
                                </div>
                                <div class="radio-inline">
                                    <label >
                                        <input type="radio" name="is_borrowed" id="optionsRadios2" value="0">未借出
                                    </label>
                                </div>

                                <%
                                    if(book.isBorrowed()){
                                %>

                                <script>
                                    $("#optionsRadios1").attr('checked', true);
                                </script>

                                <%
                                    }else {
                                %>

                                <script>
                                    $("#optionsRadios2").attr('checked', true);
                                </script>

                                <%
                                    }
                                %>

                            </div>


                            <div class="input-group">
                                <span  class="input-group-addon">持有者ID</span>
                                <input type="text" class="form-control" name="owner_id"  value="<%= book.getOwnerId()%>" >
                            </div>


                            <input style="margin-top: 10px" type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
                            <script>
                                $("#addbook").submit(function () {
                                    if($("#name").val()==''||$("#author").val()==''||$("#publish").val()==''||$("#isbn").val()==''||$("#introduction").val()==''||$("#language").val()==''||$("#price").val()==''||$("#pubstr").val()==''||$("#classId").val()==''||$("#number").val()==''){
                                        alert("请填入完整图书信息！");
                                        return false;
                                    }
                                })
                            </script>
                        </form>
                    </div>
                </div>

            </div>

            <%
                }
            %>

        </div>
    </div>
</body>
</html>
