<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书信息添加</title>
    <link rel="shortcut icon"  href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!--通过CDN引用jQuery-->
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        .form-group {
            margin-bottom: 0;
        }
    </style>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div id="header"></div>
                <div style="position: relative;padding-top: 60px; width: 80%;margin-left: 10%">
                    <form action="http://localhost:8080/Library/AddBookServlet" method="get">
                        <div class="form-group">
                            <label for="name">图书名</label>
                            <input type="text" class="form-control" name="name" id="name" placeholder="请输入书名">
                        </div>
                        <div class="form-group">
                            <label for="author">作者</label>
                            <input type="text" class="form-control" name="author" id="author" placeholder="请输入作者名">
                        </div>
                        <div class="form-group">
                            <label for="press">出版社</label>
                            <input type="text" class="form-control" name="press" id="press" placeholder="请输入出版社">
                        </div>
                        <div class="form-group">
                            <label for="introduction">简介</label>
                            <textarea class="form-control" rows="3" name="introduction" id="introduction"
                                      placeholder="请输入简介"></textarea>
                        </div>


                        <input type="submit" value="添加" class="btn btn-success btn-sm" class="text-left">
                        <script>
                            $("#addbook").submit(function () {
                                if ($("#name").val() == '' || $("#author").val() == '' || $("#publish").val() == '' || $("#isbn").val() == '' || $("#introduction").val() == '' || $("#language").val() == '' || $("#price").val() == '' || $("#pubstr").val() == '' || $("#classId").val() == '' || $("#pressmark").val() == '' || $("#number").val() == '') {
                                    alert("请填入完整图书信息！");
                                    return false;
                                }
                            })
                        </script>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>