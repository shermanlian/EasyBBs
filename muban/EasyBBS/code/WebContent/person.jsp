<%-- 
    Document   : person
    Created on : 2019-1-12, 14:05:33
    Author     : 19310_000
--%>

<%@page import="edu.cuit.easybbs.entity.user"%>
<%@page import="edu.cuit.easybbs.dao.DB"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>用户信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
<link rel="stylesheet" type="text/css" href="styles.css">
 -->
 <style>
body {
	background-repeat: no-repeat;
	background-position: -30% 50%;
}
</style>
</head>
    <body background="image/mao3.jpg">
	<%
		String username;
		String password;
		String sex;
		String age;
		String telephone;
		String email;
		user userinfo = new user();
		username = (String) session.getAttribute("username");
		Connection conn = null;
		conn = DB.getCon();
		Statement st = conn.createStatement();
		String sql = ("SELECT `password`,sex, age ,telephone,email FROM userinfo WHERE username='"
				+ username + "'");
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			userinfo.setPassword(rs.getString(1));
			userinfo.setSex(rs.getString(2));
			userinfo.setAge(rs.getString(3));
			userinfo.setTelephone(rs.getString(4));
			userinfo.setEmail(rs.getString(5));
		}
		password = userinfo.getPassword();
		sex = userinfo.getSex();
		age = userinfo.getAge();
		email = userinfo.getEmail();
		telephone = userinfo.getTelephone();
	%>

	<br />
	<center>
		<h1>苏婷和连雯怡的情侣空间</h1>
	</center>
	<br />
	<center>
		<h2>个人资料查询</h2>
	</center>
	<br />
	<center>
		<table width="500" height="300" border="5" cellspacing="5"
			cellpadding="5">
			<tr>
				<td width="129"><font size="5" >用户名</font></td>
				<td width="322"><font size="5" >
						<%
							out.println(username);
						%>
				</font></td>
			</tr>
			<tr>
				<td><font size="5">密 码</font></td>
				<td><font size="5" >
						<%
							out.println(password);
						%>
				</font></td>
			</tr>
			<tr>
				<td><font size="5" >性 别</font></td>
				<td><font size="5" >
						<%
							out.println(sex);
						%>
				</font></td>
			</tr>
			<tr>
				<td><font size="5" >年 龄</font></td>
				<td><font size="5" >
						<%
							out.println(age);
						%>
				</font></td>
			</tr>
			<tr>
				<td><font size="5" >电 话</font></td>
				<td><font size="5" >
						<%
							out.println(telephone);
						%>
				</font></td>
			</tr>
			<tr>
				<td><font size="5" >邮 箱</font></td>
				<td><font size="5" >
						<%
							out.println(email);
						%>
				</font></td>
			</tr>
		</table>
	</center>
	<center>
		<a href="mainForm.jsp">返回</a>
	</center>
</body>
</html>
