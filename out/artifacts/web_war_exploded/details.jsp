<%--
  Created by IntelliJ IDEA.
  User: lwy
  Date: 2020/11/12
  Time: 下午8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib tagdir = "/WEB-INF/tags" prefix="getdetails" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人信息</title>
    <style>

    </style>
</head>
<body>
<getdetails:getdetails>
</getdetails:getdetails>
<div id = center>
    <form action="setdetails.jsp" method="post" name="set_details">
        <table class="hovertable">
            <tr>
                <td colspan="5" align="center" style="font-size:30px;height: 80px;width:350px;"><strong>个人信息</strong></td>
            </tr>
            <tr>
                <th>性别：</th>
                <td>
                    <label>
                        <input type="radio" name="gd" id="" class="a-radio" value=1 <%= gender==1?"Checked":"" %> >
                        <span class="b-radio"></span>男
                    </label>
                    <label>
                        <input type="radio" name="gd" id="" class="a-radio" value=0 <%= gender==0?"Checked":"" %> >
                        <span class="b-radio"></span>女
                    </label>
                </td>
            </tr>
            <tr>
                <th>年龄：</th>
                <td>
                    <label>
                        <input type="text" type="text" name="age" value = <%=age %>
                                style="width:200px;" maxlength="2">
                    </label>
                </td>
            </tr>
            <tr>
                <th>联系方式：</th>
                <td>
                    <label>
                        <input type="text" type="text" name="phone_number" style="width:200px;" maxlength="11" value = <%=phone_number %> >
                    </label>
                </td>
            </tr>
            <tr>
                <th>所在学校：</th>
                <td>
                    <label>
                        <input type="text" type="text" name="school" style="width:200px;" maxlength="40" value = <%=school %> >
                    </label>
                </td>
            </tr>
            <tr>
                <th>详细地址：</th>
                <td>
                    <label>
                        <input type="text" type="text" name="address" style="width:200px;" maxlength="40" value = <%=address %> >
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type = "submit" value = " 修 改  ">
                    <input type = "button" value = " 返 回  " onclick="location='home.jsp'">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
