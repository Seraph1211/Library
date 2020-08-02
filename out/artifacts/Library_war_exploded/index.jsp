<%@ page import="guohao.utils.UserInfoUtil" %>
<%@ page import="guohao.bean.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Seraph
  Date: 2020/7/21
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Home</title>

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
      #carousel_home{
        margin-bottom: 20px;
      }
      .item{
        height: 600px;
      }
      /*.img-circle{*/
      /*  width: 36px;*/
      /*  height: 36px;*/
      /*  margin-top: 8px;*/
      /*}*/

    </style>
  </head>
  <body>

  <%
    if(UserInfoUtil.userType == 1){  //普通用户
  %>
  <script>
    $(function () {
      $("#ul_home_register_login").hide();
      $("#ul_home_user").show();
      $("#ul_home_admin").hide();
    })
  </script>
  <%
  }else if(UserInfoUtil.userType == 0){
  %>
  <script>
    $(function () {
      $("#ul_home_register_login").hide();
      $("#ul_home_user").hide();
      $("#ul_home_admin").show();
    })
  </script>
  <%
  }else {
  %>
  <script>
    $(function () {
      $("#ul_home_register_login").show();
      $("#ul_home_user").hide();
      $("#ul_home_admin").hide();
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
              <li class="active"><a href="#">Home</a> </li>
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

            <ul class="nav navbar-nav navbar-sub  pull-right" id="ul_home_register_login">
              <li><a href="register.jsp">Register</a> </li>
              <li><a href="login.jsp">Login</a> </li>
            </ul>

            <ul class="nav navbar-nav navbar-sub  pull-right" id="ul_home_user">
<%--              <li><img alt="140x140" src="img/img5.jpg" class="img-circle" /></li>--%>
              <li><a href="user_info.jsp" id="home_user_name">User</a> </li>
            </ul>

            <ul class="nav navbar-nav navbar-sub  pull-right" id="ul_home_admin">
              <li><a href="user_info.jsp">Admin</a> </li>
            </ul>

          </div>
        </div>
      </div>

      <div class="carousel slide" id="carousel_home">
        <ol class="carousel-indicators">
          <li data-slide-to="0" data-target="#carousel_home">
          </li>
          <li data-slide-to="1" data-target="#carousel_home" class="active">
          </li>
          <li data-slide-to="2" data-target="#carousel_home">
          </li>
        </ol>
        <div class="carousel-inner">
          <div class="item">
            <img alt="" src="img/carousel_1.jpg" />
            <div class="carousel-caption">
              <h4>
                《在路上》
              </h4>
              <p>
                我要再和生活死磕几年。要么我就毁灭，要么我就注定铸就辉煌。
                <br>
                如果有一天，你发现我在平庸面前低了头，就向我开炮。
              </p>
            </div>
          </div>
          <div class="item active">
            <img alt="" src="img/carousel_2.jpg" />
            <div class="carousel-caption">
              <h4>
                《梁山伯与祝英台》
              </h4>
              <p>
                “英台不是女儿身，因何耳上有环痕？ ”
                <br>
                “耳环痕有原因，梁兄何必起疑云，村里酬神多庙会，年年由我扮观音，梁兄做文章要专心，你前程不想想钗裙。 ”
                <br>
                “我从此不敢看观音。”
              </p>
            </div>
          </div>
          <div class="item">
            <img alt="" src="img/carousel_3.jpg" />
            <div class="carousel-caption">
              <h4>
                《亲爱的安德烈》
              </h4>
              <p>
                卒子一过河，或动或静都没有回头的路。人生中一个决定牵动另一个决定，一个偶然注定另一个偶然，因此偶然从来不是偶然，一条路势必走向下一条路，回不了头。
                我发现，人生中所有的决定，其实都是不回头的“卒”。

              </p>
            </div>
          </div>
        </div>
        <a class="left carousel-control" href="#carousel_home" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel_home" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
      </div>

      <div class="row">
        <div class="col-md-4">
          <div class="thumbnail">
            <img alt="300x200" src="img/bainiangudu.jpg" class="book_img"/>
            <div class="caption">
              <h3>
                《百年孤独》
              </h3>
              <p>
                《百年孤独》是魔幻现实主义文学的代表作，描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰，反映了拉丁美洲一个世纪以来风云变幻的历史。
              </p>
              <p>
                <a class="btn btn-primary" href="#">Learn more</a>
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="thumbnail">
            <img alt="300x200" src="img/baiyexing.jpg" class="book_img"/>
            <div class="caption">
              <h3>
                《白夜行》
              </h3>
              <p>
                《白夜行》是东野圭吾当之无愧的鸿篇巨制，用一桩离奇命案牵出案件相关人跨越19年惊心动魄的故事，悲凉的爱情、吊诡的命运、令人发指的犯罪、白描又生动的社会图景、复杂人性的对决与救赎，读来令人叹为观止。
              </p>
              <p>
                <a class="btn btn-primary" href="#">Learn more</a>
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="thumbnail">
            <img alt="300x200" src="img/xiaowangzi.jpg" class="book_img"/>
            <div class="caption">
              <h3>
                《小王子》
              </h3>
              <p>
                《小王子》用孩子式的眼光，透视出成人的空虚、盲目和愚妄，用浅显天真的语言写出人类的孤独寂寞、没有根基随风流浪的命运，用温馨、真挚的情感表达出对真善美的讴歌。
              </p>
              <p>
                <a class="btn btn-primary" href="#">Learn more</a>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4">
          <div class="thumbnail">
            <img alt="300x200" src="img/santi.jpg" class="book_img"/>
            <div class="caption">
              <h3>
                《三体》
              </h3>
              <p>
                文化大革命如火如荼进行的同时，军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。
                <br>
                地球文明向宇宙发出的高声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……
              </p>
              <p>
                <a class="btn btn-primary" href="#">Learn more</a>
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="thumbnail">
            <img alt="300x200" src="img/renjianshige.jpg" class="book_img"/>
            <div class="caption">
              <h3>
                《人间失格》
              </h3>
              <p>
                胆小鬼连幸福都害怕，碰到棉花都会受伤。
                <br>
                人间失格，即丧失为人的资格。这是太宰治生平最后一部作品，也是他最重要的作品。
              </p>
              <p>
                <a class="btn btn-primary" href="#">Learn more</a>
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="thumbnail">
            <img alt="300x200" src="img/biancheng.jpg" class="book_img"/>
            <div class="caption">
              <h3>
                《边城》
              </h3>
              <p>
                这是一部田园牧歌式的杰作。在这部小说中，沈从文描绘了一个如同世外桃源般的边城小镇，以及一个纯粹、美丽而淡淡忧伤的爱情故事。
                <br>
                在他的笔下，湘西淳朴天然的人情世道，野性自由的生命形态，以及澄澈纯净的人性，均一一铺呈开来，婉约而惆怅。沈从文关于“爱”与“美”的美学理想，在这部小说中得到了完整的体现。
              </p>
              <p>
                <a class="btn btn-primary" href="#">Learn more</a>
              </p>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
  </body>
</html>
