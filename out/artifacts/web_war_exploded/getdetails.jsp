<%--
  Created by IntelliJ IDEA.
  User: lwy
  Date: 2020/11/12
  Time: 下午8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%@ tag import="java.sql.*" %>
<%@ variable name-given="gender" variable-class="java.lang.Integer" scope="AT_END"%>
<%@ variable name-given="age" variable-class="java.lang.Integer" scope="AT_END"%>
<%@ variable name-given="phone_number" variable-class="java.lang.String" scope="AT_END"%>
<%@ variable name-given="school" variable-class="java.lang.String" scope="AT_END" %>
<%@ variable name-given="address" variable-class="java.lang.String" scope="AT_END"%>
<%
    String username = (String)session.getAttribute("username");
    if (username != null){
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1:3306/user_data";
        String um = "root";
        String psw= "8876";
        Connection conn = DriverManager.getConnection(url, um, psw);
        if(conn != null){
            String sql = "select * from user_data.details where username='"+username+"'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                String ss = rs.getString(1);
                int gender = rs.getInt(2);
                int age = rs.getInt(3);
                String phone_number = rs.getString(4);
                String school = rs.getString(5);
                String address = rs.getString(6);
                jspContext.setAttribute("gender", gender);
                jspContext.setAttribute("age", age);
                jspContext.setAttribute("phone_number", phone_number);
                jspContext.setAttribute("school", school);
                jspContext.setAttribute("address", address);
            }
        }
    }
    else{
        out.println("<script language='javascript'>alert('请先登录！');window.location.href='login.jsp';</script>");
    }
%>