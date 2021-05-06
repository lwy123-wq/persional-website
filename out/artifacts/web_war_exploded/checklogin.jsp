<%--
  Created by IntelliJ IDEA.
  User: lwy
  Date: 2020/11/12
  Time: 下午8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<body>
<%
    String username = new String(request.getParameter("username").getBytes("ISO8859_1"),"utf-8");
    String password = new String(request.getParameter("password").getBytes("ISO8859_1"),"utf-8");
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost/db";
    String um = "lwy";
    String psw= "123456";
    Connection conn = DriverManager.getConnection(url, um, psw);
    if(conn != null){
        String sql = "select * from user where username='"+username+"' and password='"+ password + "'";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        if(rs.next()){
            session.setAttribute("username",username);
            out.println("<script language='javascript'>alert('登录成功！');window.location.href='Home.jsp';</script>");
        }
        else{
            out.println("<script language='javascript'>alert('登录失败！');window.location.href='login.jsp';</script>");
        }
    }
%>
</body>
</html>
