<%--
  Created by IntelliJ IDEA.
  user: lwy
  Date: 2020/11/5
  Time: ����10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>��ҳ</title>
    <style>
        .navbar {
            overflow: hidden;
            background-color: #333;
        }


        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        .navbar a.right {
            float: right;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        @media screen and (max-width: 400px) {
            .navbar a {
                float: none;
                width: 100%;
            }
        }

    </style>
</head>
<body style="
        font-size: 16px;
        line-height: 1.4em;
        letter-spacing: 0.08em;
        padding: 0;
        margin: 0;
        background: url('lib/17.jpg') fixed center center no-repeat;
        background-size: cover;
        width: 100%;
    ">
<div class="ace-head-inner">
    <div class="ace-head-container ace-container">
        <div class="ace-head-row">
            <div id="ace-head-col1" class="ace-head-col text-left">
                        <span>
                            <%
                                String username = (String)session.getAttribute("username");
                                if (username != null){
                                    out.println("���ã�"+username+"&nbsp;<a href='logout.jsp'>�˳���½</a>&nbsp;&nbsp;");
                                }
                                else{
                                    out.println("����δ��½&nbsp;<a href='login.jsp'>��˵�½</a>&nbsp;&nbsp;");
                                }
                            %>
                        </span>
            </div>
            <nav id="ace-main-nav">
                <ul class="clear-list">
                    <%
                        if (username != null){
                            out.println("<li><a href='details.jsp'>������Ϣ</a></li>");
                        }
                    %>
                    <div class="navbar">
                    <li><a href="home.jsp">��ҳ</a></li>
                    <li><a href="profile.jsp">���߼��</a></li>
                    <li><a href="hometown.jsp">�������</a></li>
                    <li><a href="board.jsp">���԰�</a></li>
                    <li><a href="about.jsp">����</a></li>
                    <li><a href="index.jsp">���ػ�ӭҳ</a></li>
                    </div>>
                </ul>
            </nav>
        </div>
    </div>
</div>
<div class = white_box>
</div>
</body>
</html>