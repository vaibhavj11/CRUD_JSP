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

if(name.length() >= 2){
	
	if(email.contains("@")){
		
		if(mobile.length() == 10){
			
			if(age != null){
				
				if(gender != null){
					
					if(country != null){
						
						if(pass.length() >= 5 && pass.contains("@") || pass.contains("#") || pass.contains("#")){
							
							if(pass.equals(cpass)){
								
								PreparedStatement ps = con.prepareStatement("insert into hema (name,email,mobile,age,pass,cpass,gender,country) values('"+name+"','"+email+"','"+mobile+"','"+age+"','"+pass+"','"+cpass+"','"+gender+"','"+country+"');");
								ps.executeUpdate();
								
								out.println("<script>");
								out.println("alert('Registration Successful .')");
								out.println("window.location.href='table.jsp'");
								out.println("</script>");
								
							}else{
								out.println("<script>");
								out.println("alert('Password and confirm password didn't matched.')");
								out.println("window.location.href='Register.html'");
								out.println("</script>");
							}
							
						}else{
							out.println("<script>");
							out.println("alert('Your password should contain @,#,$ an length should be greater >= 5 .')");
							out.println("window.location.href='Register.html'");
							out.println("</script>");
						}
						
					}else{
						out.println("<script>");
						out.println("alert('country field is empty .')");
						out.println("window.location.href='Register.html'");
						out.println("</script>");
					}
					
				}else{
					
						out.println("<script>");
						out.println("alert('Gender field is empty .')");
						out.println("window.location.href='Register.html'");
						out.println("</script>");
					
				}
				
			}else{
				out.println("<script>");
				out.println("alert('Please enter age .')");
				out.println("window.location.href='Register.html'");
				out.println("</script>");
			}
			
		}else{
			out.println("<script>");
			out.println("alert('Please enter valid Mobile Number .')");
			out.println("window.location.href='Register.html'");
			out.println("</script>");
		}
		
	}else{
		out.println("<script>");
		out.println("alert('Please enter valid email .')");
		out.println("window.location.href='Register.html'");
		out.println("</script>");
	}
	
	
}else{
	out.println("<script>");
	out.println("alert('Please enter valid name .')");
	out.println("window.location.href='Register.html'");
	out.println("</script>");
}

%>
</body>
</html>