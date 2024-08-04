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

int v = Integer.parseInt(request.getParameter("x"));

Class.forName("org.postgresql.Driver");
Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/Registration","postgres","Vaibhav@2001");

PreparedStatement ps = con.prepareStatement("delete from hema where id = '"+v+"' ");
ps.executeUpdate();

response.sendRedirect("table.jsp");

%>

</body>
</html>