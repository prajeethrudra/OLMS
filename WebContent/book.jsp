<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="bootstrap.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-responsive.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="bootstrap.min.js"></script>
<link href="librariandashboard.css" type="text/css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Carrois+Gothic+SC'
    rel='stylesheet' type='text/css'>
</head>
<body>
<%
String bookid = request.getParameter("bookid");
String userid = (String)session.getAttribute("userid");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "password");
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from books_information where bookid='"+bookid+"'");
rs.next();
%>
<body>
    <div class="header1">
        <img src="images/thumb 4.png" width="130" height="30" />
              <form action = "search.jsp" method ="post" class="form-search" style="margin-left: 760px;margin-top:-48px;">
  <div class="input-append" >
    <input type="text" name = "book" class="span2 search-query" style="width:400px;background-color:#00987b;border-color:#00987b;color:white;" placeholder="search by bookname">
    <input type="submit" class="btn" style="" value ="Search" />
  </div>
</form>
 <span style="color:white;float: right;margin-top: -50px;margin-right: 200px;">Hello <%=userid%>!!!</span>
        <a href="Logout.jsp"><img alt="" src="images/exit-48.png" style="color:white;float: right;margin-top: -60px;margin-right: 100px;"/></a>
    </div>
    <div class="content">
       <div class="leftnav">
        <%String Role = (String)session.getAttribute("role");
        if(Role.equals("librarian")){
        %>
            <a href="librariandashboard.jsp" style="text-decoration: none;">
                <div class="icons">
                    <div id="bgimg"></div>
                    <p class="imgcaption">ISSUES</p>
                </div>
            </a>
            <%}else if(Role.equals("student")){ %> <a href="historydashboard.jsp" style="text-decoration: none;">
                <div class="icons">
                    <div id="bgimg4"></div>
                    <p class="imgcaption" style="margin: -5px 10px;">History</p>
                </div>
            </a> 
            <%} %> 
            </a> <a href="cataloguedashboard.jsp" style="text-decoration: none;">
                <div class="icons">
                    <div id="bgimg2"></div>
                    <p class="imgcaption" style="margin: -5px 0px;">CATALOGUE</p>
                </div>
            </a> <a href="treedashboard.jsp" style="text-decoration: none;">
                <div class="icons">
                    <div id="bgimg3"></div>
                    <p class="imgcaption" style="margin: -5px 24px;">TREE</p>
                </div>
            </a>
            <%if(Role.equals("librarian")){
            %>
            <a href="insertbook2.jsp" style="text-decoration: none;">
                <div class="icons">
                    <div id="bgimg4"></div>
                    <p class="imgcaption" style="margin: -5px 24px;">Insert Book</p>
                </div>
            </a><%} %>
        </div>  
        <div class="maincontent" >
            <div class="heading">
                <p class="subheading"
                    style="margin-left: 700px; margin-top: 18px; position: absolute;">
                    <img alt="" src="images/book-32.png" style="padding-right: 10px;">Book Information
                </p>
            </div>
             
     <div class="newitem"
				style=" background-color:transparent; box-shadow: none; height: 1000px;margin:auto 460px;"> 
               
                <div class="cat-header"
                    style=" height: 300px; width: 700px; float: left; padding: 10px; margin:10px auto;border-radius: 2%;border: none;overflow: hidden;">
                   <img alt="" src="<%=rs.getString("bookimagepath")%>"
                        style="height: 300px; width: 260px; border-radius: 2%; float:left; margin: auto;"><br />
                    <p class="book-title" style="text-overflow:ellipsis; margin-left:350px; font-size:25px; white-space:nowrap;max-height:18px;"><%=rs.getString("bookname")%></p>
                    <p style="color:#00b190;margin-left:350px; font-size:20px;">by <%=rs.getString("bookauthor")%></p><br /><br />
                    <p style="margin-left:350px; font-size:20px;">Category: <%=rs.getString("bookcategory")%></p>
                    <p style="margin-left:350px; font-size:20px;">Status: <%=rs.getString("status")%></p>
                   
                </div>
                </div>
                </div>
        </div>
        <%stmt.close();
        conn.close();%>
</body>
</body>
</html>