<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Seraph
  Date: 2020/7/21
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>

    <title>test</title>
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
        #h2_register{
            margin-top: 8%;
        }
        #btn_sign_up{
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
%>

<h2 class="text-center text-info" id="h2_register">用户注册</h2>
<div class="container" id="div_login_form">
    <form action="http://localhost:8080/Library/RegisterServlet" method="get">
        <div class="form-group">
            <label for="account">Account</label>
            <input type="text" class="form-control" id="account" name="user_name" placeholder="请输入用户名">
            <span style="color: red"><%= uError%></span>
            <span style="color: red"><%= msg%></span>
        </div>
        <div class="form-group">
            <label for="pwd">Password</label>
            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="请输入密码">
        </div>
        <div class="form-group">
            <label for="confirm_pwd">Confirm Password</label>
            <input type="password" class="form-control" id="confirm_pwd" name="confirm_pwd" placeholder="请再次输入密码">
            <span style="color: red"><%= pError%></span>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-default" id="btn_sign_up" style="margin: 0px auto;display: table;">Sign up</button>
        </div>
        <div class="form-group text-center">
            <a href="javascript:window.location.href='login.jsp'">已有账号？点此登录</a>
        </div>
    </form>
</div>
</body>
</html>
