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


Class.forName("org.postgresql.Driver");

Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/Registration","postgres","Vaibhav@2001");

PreparedStatement ps = con.prepareStatement("select * from hema");

ResultSet rs = ps.executeQuery();




%>
<table border="1px">
<tr>

<th> ID </th>
<th> NAME </th>
<th> EMAIL </th>
<th> MOBILE </th>
<th> AGE </th>
<th> PASSWORD </th>
<th> CONF. PASSWORD </th>
<th> GENDER </th>
<th> COUNTRY </th>
<th> ACTIONS </th>

</tr>
<%while(rs.next()){ %>
<tr>

<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>
<td>
  <a href="Edit.jsp?x=<%=rs.getInt(1)%>" class="btn btn-outline-info">EDIT</a>
  <a href="Delete.jsp?x=<%=rs.getInt(1) %>" class="btn btn-outline-danger">DELETE</a>
</td>

</tr>
<% } %>
</table>
<%


%>
</body>
</html>