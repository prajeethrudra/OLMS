<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import= "java.sql.ResultSet"%>
<%@page import="java.sql.Statement" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String userid = request.getParameter("userid");
String password = request.getParameter("password");
String confirmpassword = request.getParameter("confirmpassword");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","password");
Statement st=con.createStatement();
if((password.equals(confirmpassword))&&(userid!="")&&(password!="")) {
	String sql = "INSERT INTO users"
        + "(userid, password)" + "VALUES('" + userid + "','" + password + "')";
	st.executeUpdate(sql);
	%><p>Registration Successful</p><%
	response.sendRedirect("Login.jsp");
}
else {
	%>Registration failed
	<br /> Please enter correct details<%
}
%>
</body>
</html>