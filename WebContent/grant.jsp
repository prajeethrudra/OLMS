<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import= "java.sql.ResultSet"%>
<%@page import="java.sql.Statement" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String bookid = request.getParameter("book");
	String user = request.getParameter("user");
	String status = request.getParameter("issuereturn");
	Date date = new Date();
	SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
	String sdate = ft.format(date);
	System.out.println(sdate);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "password");
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery("select status, userid, bookname from books_information WHERE bookid = '"+bookid+"';");
	rs.next();
	String bookname = rs.getString("bookname");
	String original_status = rs.getString("status");
	String userid = rs.getString("userid");
	
	if(original_status.equals("Issue")&&status.equals("Return")) { 
		if(user.equals(userid)){
			stmt.executeUpdate("UPDATE books_information SET status='"+status+"', userid='"+user+"' WHERE bookid = '"+bookid+"';");
		    stmt.executeUpdate("INSERT INTO history (userid, bookname, status, date) VALUES ('"+user+"','"+bookname+"', '"+status+"', '"+sdate+"');");
		   response.sendRedirect("librariandashboard.jsp?pending=successreturn");
		}
		else {
			out.println("Sorry your request can not be proceeded.\n");
			out.println("<p>The book <b>\'"+bookname+"\'</b> is "+original_status+"d to the "+userid+"</p");
			response.sendRedirect("librariandashboard.jsp?pending=failedreturn");

		}
	}
	
	else if(original_status.equals("Return")&&status.equals("Issue")) {
		stmt.executeUpdate("UPDATE books_information SET status='"+status+"', userid='"+user+"' WHERE bookid = '"+bookid+"';");
		 stmt.executeUpdate("INSERT INTO history (userid, bookname, status, date) VALUES ('"+user+"','"+bookname+"', '"+status+"', '"+sdate+"');");
		 response.sendRedirect("librariandashboard.jsp?pending=successissue");
	    out.println("<p>The book <b>\'"+bookname+"\'</b> is "+status+"d to the "+user+"</p");
	}
	else  {
		out.println("Sorry your request can not be proceeded.\n");
	    out.println("<p>The book <b>\'"+bookname+"\'</b> is "+original_status+"d to the "+userid+"</p");
		response.sendRedirect("librariandashboard.jsp?pending=failed"+status);

	}
%>
</body>
</html>