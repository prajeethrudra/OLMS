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

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","password");
Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from users where userid='" + userid + "'and password='" + password + "'");
if (rs.next()) {  
	String role=rs.getString("role");
    session.setAttribute( "userid", userid );
    session.setAttribute( "role", role );
    out.println("welcome " + userid);
    out.println("\nSuccesfull login");

    out.println("\n you role is:" + role );
    if(role.equals("librarian")){
    	System.out.println("hi");
        response.sendRedirect("librariandashboard.jsp");
    }
    else if(role.equals("student")){
        response.sendRedirect("historydashboard.jsp");
    }
   
    else{
        out.println("could not redirect");
    }
}
else{
    //out.println("login failed.");
    String loginfailed="login failed";
    response.sendRedirect("Login.jsp?message="+loginfailed);
   // out.println(password);
  //  out.println(userid);
}
%>
</body>
</html>