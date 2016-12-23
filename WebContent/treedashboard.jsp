<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@page import="java.sql.*"%>
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
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="js/jquery.tabelizer-master/jquery-ui-1.10.4.custom.min.js"></script>
<script src="js/jquery.tabelizer-master/jquery.tabelizer.js"></script>
 <link href="js/jquery.tabelizer-master/tabelizer.min.css" media="all" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
 $(document).ready(function(){
		var table1 = $('#table1').tabelize({
			/*onRowClick : function(){
				alert('test');
			}*/
			fullRowClickable : true,
			onReady : function(){
				console.log('ready');
			},
			onBeforeRowClick :  function(){
				console.log('onBeforeRowClick');
			},
			onAfterRowClick :  function(){
				console.log('onAfterRowClick');
			},
		});
	});
 </script>
</head>
 <% 
 String Role=(String) session.getAttribute("role");
 System.out.println();
 Class.forName("com.mysql.jdbc.Driver");
 // connection to mySQL server and  Open a connection
 System.out.println("Connecting to a selected database...");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "password");
 System.out.println("Connected to database successfully...");
 Statement stmt=conn.createStatement();
 Statement stmt2=conn.createStatement();
 Statement stmt3=conn.createStatement();
 ResultSet rs=stmt.executeQuery("select DISTINCT bookcategory from books_information");%>
<body>
<div class="header1">
		<img src="images/thumb 4.png" width="130" height="30" />
			<form class="form-search" action="search.jsp" method="post"
			style="margin-left: 760px; margin-top: -48px;">
			<div class="input-append">
				<input type="text" class="span2 search-query"
					style="width: 400px; background-color: #00987b; border-color: #00987b; color: white;"
					placeholder="search by bookname" name="book">
				<button type="submit" class="btn" style="">Search</button>
			</div>

		</form>
		<span style="color:white;float: right;margin-top: -50px;margin-right: 200px;">Hello!!</span>
		<a href="Logout.jsp"><img alt="" src="images/exit-48.png" style="color:white;float: right;margin-top: -60px;margin-right: 100px;"/></a>
	</div>
	<div class="content">
		<div class="leftnav">
				<%if(Role.equals("librarian")){ %>
			<a href="librariandashboard.jsp" style="text-decoration: none;">
				<div class="icons">
					<div id="bgimg"></div>
					<p class="imgcaption">ISSUES</p>
				</div>
			</a> 
			  <a href="insertbook2.jsp" style="text-decoration: none;">
                <div class="icons">
                    <div id="bgimg5"></div>
                    <p class="imgcaption" style="margin: -5px 10px;">ADDBOOK</p>
                </div>
            </a>
			<%}
		else if(Role.equals("student")){
		%><a href="historydashboard.jsp" style="text-decoration: none;">
				<div class="icons">
					<div id="bgimg4"></div>
					<p class="imgcaption" style="margin: -5px 16px;">History</p>
				</div>
				
			</a> 
			<%} %> <a href="cataloguedashboard.jsp" style="text-decoration: none;">
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
		</div>

		<div class="maincontent">
			<div class="heading">
				<p class="subheading"
					style="margin-left: 700px; margin-top: 18px; position: absolute;"><img alt="" src="images/book-32.png" style="padding-right:10px;">Tree</p>
			</div>

			<div class="newitem" style="margin-top: 10px;height:auto;padding:20px;width: 1620px;">
			<table id="table1" class="controller">
    <tr data-level="header" class="header"><td></td>

<%

while(rs.next()){
	String category=rs.getString("bookcategory");
%>
	<tr data-level="1" id="<%=category %>"><td><%=category %></td>
	
<%
ResultSet rs2=stmt2.executeQuery("select * from books_information where bookcategory='"+category+"'");

while(rs2.next()){
	
	String bookname=rs2.getString("bookname");
	
	%>

<tr data-level="2" id="<%=bookname%>"><td><a href="book.jsp?bookid=<%=rs2.getString("bookid")%>" style="text-decoration:none;color:white;">BOOK:-<%=bookname%></a></td>	
<%
ResultSet rs3=stmt3.executeQuery("select bookauthor from books_information where bookname='"+bookname+"'");

while(rs3.next()){

	String bookauthor=rs3.getString("bookauthor");
	%>
<tr data-level="3" id="<%=bookauthor%>"><td>AUTHOR:-<%=bookauthor%></td>	
<%
}

}

}

%>

</table> 
			</div>
		</div>


	</div>
</body>
</html>