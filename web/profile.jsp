<%--
  Created by IntelliJ IDEA.
  User: lwy
  Date: 2020/11/12
  Time: 下午8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>作者简介</title>
    <style>
        body{
            text-align:center;
            background: url("lib/18.jpg") fixed center center no-repeat;
            background-size: cover;
            width: 100%;
        }
        #center{
            margin:0 auto;
            border:1px soild #000;
            width:300px;
            height:300px
        }
        *{
            padding: 0;
            margin: 0;
        }
        .black_half{
            padding: 25px;
            background-color: rgba(0,0,0,0.5);
        }
        .black_half h1{
            color: #FFFFFF;
        }
        .black_half a{
            text-decoration:none;
            color: #FFFFFF;
        }
        .black_half a:hover{
            text-decoration:underline;
            color: #FFFFFF;
        }
        .white h3{
            color: #FFFFFF;
        }
    </style>
</head>
<body>
<div class="ace-head-inner">
    <div class="ace-head-container ace-container">
        <div class="ace-head-row">
            <div id="ace-head-col1" class="ace-head-col text-left">
                        <span>
                            <%
                                String username = (String)session.getAttribute("username");
                                if (username != null){
                                    out.println("您好，"+username+"&nbsp;<a href='logout.jsp'>退出登陆</a>&nbsp;&nbsp;");
                                }
                                else{
                                    out.println("您还未登陆&nbsp;<a href='login.jsp'>点此登陆</a>&nbsp;&nbsp;");
                                }
                            %>
                        </span>
            </div>
            <nav id="ace-main-nav">
                <ul class="clear-list">
                    <%
                        if (username != null){
                            out.println("<li><a href='details.jsp'>个人信息</a></li>");
                        }
                    %>
                    <li><a href="home.jsp">主页</a></li>
                    <li><a href="profile.jsp">作者简介</a></li>
                    <li><a href="hometown.jsp">家乡介绍</a></li>
                    <li><a href="board.jsp">留言板</a></li>
                    <li><a href="about.jsp">关于</a></li>
                    <li><a href="index.jsp">返回欢迎页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<div class = white_box>
    <div     style="text-align:center;">
        <br>
        <h1><b>作者简介——我</b><br></h1>
        <br>
        <img src="./img/myphoto.jpg" style="display:block;max-height:200px;max-width:200px;margin:0 auto;"/><br>
        <br>
        <h2 style="display:inline;">name:</h2>刘伟怡
        <br><br>
        <h2 style="display:inline;">pingyin:</h2>
        <br><br>
        <h2 style="display:inline;">En-name:</h2>萌团子
        <br><br>
        <h2 style="display:inline;">birth:</h2>2000-03
        <br><br>
        <h2 style="display:inline;">phone:</h2>182****5630
        <br><br>
        <h2 style="display:inline;">e-mail:</h2>l2158******@qq.com
        <br><br>
        <h2 style="display:inline;">school:</h2>天津职业技术师范大学
        <br><br>
        <h2 style="display:inline;">major:</h2>软件工程
        <br><br>
        <h2 style="display:inline;">class:</h2>软件1902
    </div>
</div>
</body>
</html>
