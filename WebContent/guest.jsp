<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@page import="java.sql.*"%>
	
<%!public int Converter(String str) {
		int convrtr = 0;
		if (str == null) {
			str = "0";
		} else if ((str.trim()).equals("null")) {
			str = "0";
		} else if (str.equals("")) {
			str = "0";
		}
		try {
			convrtr = Integer.parseInt(str);
		} catch (Exception e) {
		}
		return convrtr;
	}%>
<%

session.setAttribute( "role", "guest" );
String Role=(String) session.getAttribute("role");
System.out.println(Role);
	int per_page = 5;
	int num = 0;
	Class.forName("com.mysql.jdbc.Driver");
	// connection to mySQL server and  Open a connection
	System.out.println("Connecting to a selected database...");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/users", "root", "password");
	System.out.println("Connected to database successfully...");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt
			.executeQuery("select COUNT(*) from books_information");
	while (rs.next()) {
		num = rs.getInt(1);

	}
	int total = (num % per_page) > 0 ? (num / per_page) + 1
			: (num / per_page);

	int page_number;
	int morph = 0;
	String pp = request.getParameter("page");
	int present_page = Converter(request.getParameter("page"));
	if (pp == null) {
		response.sendRedirect("cataloguedashboard.jsp?page=1");
	} else {
		page_number = present_page;

		morph = page_number;

		int start = ((morph - 1) * per_page);

		ResultSet rs2 = stmt
				.executeQuery("select * from books_information LIMIT "
						+ start + "," + per_page);
%>
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
		<span style="color:white;float: right;margin-top: -50px;margin-right: 200px;">Hello !!!</span>
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
			<%} %>
			<a href="cataloguedashboard.jsp" style="text-decoration: none;">
				<div class="icons">
					<div id="bgimg2"></div>
					<p class="imgcaption" style="margin: -5px 0px;">CATALOGUE</p>
				</div>
				
			</a> 
			<a href="treedashboard.jsp" style="text-decoration: none;">
				<div class="icons">
					<div id="bgimg3"></div>
					<p class="imgcaption" style="margin: -5px 24px;">TREE</p>
				</div>
			</a>
		</div>


		<div class="maincontent">
			<div class="heading">
				<p class="subheading"
					style="margin-left: 700px; margin-top: 18px; position: absolute;">
					<img alt="" src="images/book-32.png" style="padding-right: 10px;">CATALOGUE
				</p>
			</div>

			<div class="newitem"
				style="margin-top: 10px; height: 1000px; padding: 20px 80px; width: 1540px; clear: both; background-color: transparent;box-shadow:none;">
				<%
					while (rs2.next()) {
				%>
				<div class="cat-header"
					style=" height: 400px; width: 260px; float: left; padding: 10px; margin:10px;border-radius: 2%;border: none;overflow: hidden;">
					<img alt="" src="<%=rs2.getString("bookimagepath")%>"
						style="height: 300px; width: 260px; border-radius: 2%; margin: auto;">
					<p class="book-title" style="text-overflow:ellipsis; overflow:hidden;white-space:nowrap;max-height:18px;"><%=rs2.getString("bookname")%></p>
					<p style="color:#00b190;"> <%=rs2.getString("bookauthor")%></p>
					<div class="box" style="width:280px;height:42px;background-color:#535353; text-align: center;
					margin-left:-10px;	font-family: 'Carrois Gothic SC', sans-serif;border-bottom-radius:2%;">
					<img alt="" src="images/plus-7-16.png" style="float:left;margin-left:-60px;position: absolute;margin-top:10px;">
					<p style="padding-top: 10px;color:#e3e3e3">View more</p>
					</div>
				</div>
				<%
					}
					}
				%>
<div class="navig" style="clear: both; margin-left:700px;padding-top: 50px;">
				<%
					for (int counter = 1; counter <= total; counter++) {
				%>
				<a href="cataloguedashboard.jsp?page=<%=counter%>" class="pagination"><%=counter%></a>
				<%
					}
				%>
				</div>
			</div>

		</div>


	</div>

</body>
</html>