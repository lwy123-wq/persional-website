<%--
  Created by IntelliJ IDEA.
  User: lwy
  Date: 2020/11/12
  Time: 下午8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<body>
<%
    String gender = new String(request.getParameter("gd").getBytes("ISO8859_1"),"utf-8");
    String age = new String(request.getParameter("age").getBytes("ISO8859_1"),"utf-8");
    String phone_number = new String(request.getParameter("phone_number").getBytes("ISO8859_1"),"utf-8");
    String school = new String(request.getParameter("school").getBytes("ISO8859_1"),"utf-8");
    String address = new String(request.getParameter("address").getBytes("ISO8859_1"),"utf-8");
    String username = (String)session.getAttribute("username");
    int _gender = Integer.parseInt(gender);
    int _age = Integer.parseInt(age);
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/user";
    String um = "lwy";
    String psw= "123456";
    Connection conn = DriverManager.getConnection(url, um, psw);
    if(conn != null){
        PreparedStatement tmt2 = conn.prepareStatement("UPDATE user.details set gender="+ _gender +",age="+ _age +",phone_number='"+ phone_number +"',school='"+ school +"',address='"+ address +"'  where username='"+username+"'");
        int rst = tmt2.executeUpdate();
        if(rst != 0){
            out.println("<script language='javascript'>alert('修改成功！');window.location.href='details.jsp';</script>");
        }
        else{
            out.println("<script language='javascript'>alert('修改失败！');window.location.href='Home.jsp';</script>");
        }
    }
%>
</body>
</html>
