<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Seraph
  Date: 2020/7/21
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!--通过CDN引用jQuery-->
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>

    <style>
        #div_login_form{
            margin-top: 10px;
            padding-left: 30px;
            padding-top: 30px;
            padding-right: 30px;
            padding-bottom: 10px;
            border: 1px solid darkgray;
            border-radius: 20px;
            width: 50%;

            vertical-align: middle;
        }
        #h2_login{
            margin-top: 10%;
        }
        #btn_sign_in{
            width: 180px;
        }
    </style>
</head>
<body>
<%
    HashMap<String, String> errorMap = (HashMap<String, String>) request.getAttribute("errorMap");

    String uError = "", pError = "";
    if(errorMap != null){
        uError = errorMap.get("uError");
        pError = errorMap.get("pError");

        if(uError == null){
            uError = "";
        }

        if(pError == null){
            pError = "";
        }
    }

    Object msg = request.getAttribute("msg");
    if(msg == null){
        msg = "";
    }

    Object info = request.getAttribute("info");
    if(info == null){
        info = "";
    }
    if(info.equals("register_success")){
%>
        <script>
                alert("注册成功！");
        </script>
<%
    }
%>

<h2 class="text-center text-info" id="h2_login">用户登录</h2>
<div class="container" id="div_login_form">
    <form action="http://localhost:8080/Library/LoginServlet" method="get">
        <div class="form-group">
            <label for="account">Account</label>
            <input type="text" class="form-control" id="account" name="user_name" placeholder="请输入用户名">
            <span style="color: red"><%= uError%></span>
        </div>
        <div class="form-group">
            <label for="pwd">Password</label>
            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="请输入密码">
            <span style="color: red"><%= pError%></span>
            <span style="color: red"><%= msg%></span>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-default" id="btn_sign_in" style="margin: 0px auto;display: table;">Sign in</button>
        </div>
        <div class="form-group text-center">
            <a href="javascript:window.location.href='register.jsp'">还没有账号？点此注册</a>
        </div>
    </form>
</div>
</body>
</html>
