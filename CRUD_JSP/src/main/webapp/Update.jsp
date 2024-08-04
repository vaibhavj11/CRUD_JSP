<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int v = Integer.parseInt(request.getParameter("id"));

String name,email,mobile,age,pass,cpass,gender,country;

name = request.getParameter("name");
email = request.getParameter("email");
mobile = request.getParameter("mobile");
age = request.getParameter("age");
pass = request.getParameter("pass");
cpass = request.getParameter("cpass");
gender = request.getParameter("gender");
country = request.getParameter("country");

Class.forName("org.postgresql.Driver");
Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/Registration","postgres","Vaibhav@2001");

PreparedStatement ps = con.prepareStatement(" update hema set name ='"+name+"',email ='"+email+"',mobile ='"+mobile+"',age ='"+age+"',pass ='"+pass+"',cpass ='"+cpass+"',gender ='"+gender+"',country ='"+country+"' where id = '"+v+"' ");
ps.executeUpdate();

out.println("<script>alert('Data updated Successfully !')</script>");
response.sendRedirect("table.jsp");%>
</body>
</html>