<%--
  Created by IntelliJ IDEA.
  User: lwy
  Date: 2020/11/28
  Time: 下午1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ page import="user.MessBor" %>
<html>
<head>
    <title>Title</title>
</head>

<!-- 留言主界面 -->
<body>
<div
        style="margin-left: 35%; margin-top: 100px; font-family: Microsoft YaHei">
    <h1 style="margin-left: 5%">这里是留言板主界面</h1>
    <form action="leavemessage.jsp" method="post">
        <table border="1">
            <caption>所有留言信息</caption>
            <tr>
                <th>留言人姓名</th>
                <th>留言时间</th>
                <th>留言标题</th>
                <th>留言内容</th>
            </tr>
            <%
                ArrayList<MessBor> al = new ArrayList<MessBor>();
                al = (ArrayList) session.getAttribute("al");
                if (al != null) {
                    Iterator iter = al.iterator();
                    while (iter.hasNext()) {
                        MessBor mb = (MessBor) iter.next();
            %>
            <tr>
                <td><%=new LoginDao().getName(mb.getId())%></td>
                <td><%=mb.getTime().toString()%></td>
                <td><%=mb.getTitle()%></td>
                <td><%=mb.getMessage()%></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </form>
    <a style="margin-left: 22%" href="leavemessage.jsp">留言</a>
</div>
</body>


</html>
