<%--
  Created by IntelliJ IDEA.
  user: lwy
  Date: 2020/11/12
  Time: 下午3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<body>
<%
    String user = new String(request.getParameter("username").getBytes("ISO8859_1"),"utf-8");
    String pwd = new String(request.getParameter("password").getBytes("ISO8859_1"),"utf-8");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    String url = "jdbc:mysql://localhost:3306/db";
    String um = "lwy";
    String psw= "123456";
    Connection conn = null;
    try {
        conn = DriverManager.getConnection(url, um, psw);


    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }

    Statement pStmt = null;
    try {
        pStmt = conn.createStatement();
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    ResultSet rs = null;
    try {
        rs = pStmt.executeQuery("select * from user where username ='"+user+"'");
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    assert rs != null;
    if(rs.next()){
        out.println("<script language='javascript'>alert('该用户已存在，请直接登陆！');window.location.href='register.jsp';</script>");
    }
    else{
        PreparedStatement tmt = conn.prepareStatement("Insert into user_data.user_info values('" + user + "','" + pwd + "')");
        int rst = tmt.executeUpdate();
        if (rst != 0){
            PreparedStatement tmt2 = conn.prepareStatement("Insert into user_data.details values('" + user + "',1,0,' ',' ',' ')");
            tmt2.executeUpdate();
            out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='login.jsp';</script>");
        }
        else{
            out.println("<script language='javascript'>alert('用户注册失败！');window.location.href='register.jsp';</script>");
        }
    }
%>
</body>
</html>
