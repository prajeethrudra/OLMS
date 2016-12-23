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
you are in student page.
<form method="post" action="search.jsp">
Search bookname: <input type="text" name="book" >
<input type="submit" value="Search">
</form>

<%
        String userid = (String)session.getAttribute("userid");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "password");
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("select  bookname, status from history where userid='"+userid+"'");
        out.println(userid);
       
        %><p>History of Books</p>
        <table><tr><td>Book name</td><td>Status</td></tr><%
        while(rs.next())
        {
        	%><tr><td><%=rs.getString("bookname")%></td><td><%=rs.getString("status")%></td></tr><%
        }%>
        </table>
</body>
</html>