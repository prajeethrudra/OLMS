
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@page import="java.sql.*"%>
<%
	String Role = (String) session.getAttribute("role");

	if (Role.equals("student")) {
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
<%
	String userid = (String) session.getAttribute("userid");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/users",
						"root", "password");
		Connection conn2 = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/users",
						"root", "password");
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn2.createStatement();
		ResultSet rs = stmt
				.executeQuery("select  bookname, status,date from history where userid='"
						+ userid + "' order by date DESC");
%>
<style>
.stick,.stickleft {
	width: 5px;
	height: 300px;
	background-color: #00b190;
}

.stick {
	float: left;
}

.stickleft {
	float: right;
}

.content2,.content2left {
	width: 400px;
	height: 200px;
	background-color: white;
	margin-top: 0px;
}

.content2:hover {
	-webkit-box-shadow: 10px 10px 5px 0px rgba(50, 50, 50, 0.45);
	-moz-box-shadow: 10px 10px 5px 0px rgba(50, 50, 50, 0.45);
	box-shadow: 10px 10px 5px 0px rgba(50, 50, 50, 0.45);
}

.content2left:hover {
	-webkit-box-shadow: -7px 8px 5px 0px rgba(50, 50, 50, 0.69);
	-moz-box-shadow: -7px 8px 5px 0px rgba(50, 50, 50, 0.69);
	box-shadow: -7px 8px 5px 0px rgba(50, 50, 50, 0.69);
}

.content2 {
	float: left;
}

.content2left {
	float: right;
}

.triangle,.triangleleft {
	width: 10px;
	height: 0;
	border-style: solid;
	margin-top: 80px;
}

.triangle {
	float: left;
	border-width: 10px 20px 10px 0;
	border-color: transparent white transparent transparent;
}

.triangleleft {
	float: right;
	border-width: 10px 0 10px 20px;
	border-color: transparent transparent transparent white;
}

.timelineitem {
	clear: both;
	margin-bottom: 0px;
	padding: -100px;
}

.timelineitemleft {
	margin-top: 0px;
	position: absolute;
	clear: both;
	margin-bottom: 0px;
}

.contentheading {
	width: 390px;
	height: 40px;
	text-align: left;
	padding-top: 10px;
	padding-left: 10px;
	padding-right: 0px;
	background-color:;
	border-bottom: 1px dotted #00b190;
}

.contentimg {
	width: 150px;
	height: 150px;
	background-color:;
	float: left;
}

.contentdetails {
	width: 250px;
	height: 100px;
	background-color:;
	float: left;
}
</style>
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
		<span
			style="color: white; float: right; margin-top: -50px; margin-right: 200px;">Hello
			<%=userid%>!!!
		</span> <a href="Logout.jsp"><img alt="" src="images/exit-48.png"
			style="color: white; float: right; margin-top: -60px; margin-right: 100px;" /></a>
	</div>
	<div class="content">
		<div class="leftnav">
			<%
				if (Role.equals("librarian")) {
			%>
			<a href="Librarian.jsp" style="text-decoration: none;">
				<div class="icons">
					<div id="bgimg"></div>
					<p class="imgcaption">ISSUES</p>
				</div>
			</a>
			<%
				} else if (Role.equals("student")) {
			%>
			<a href="historydashboard.jsp" style="text-decoration: none;">
				<div class="icons">
					<div id="bgimg4"></div>
					<p class="imgcaption" style="margin: -5px 10px;">History</p>
				</div>
			</a>
			<%
				}
			%>
			<a href="cataloguedashboard.jsp" style="text-decoration: none;">
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
					style="margin-left: 740px; margin-top: 18px; position: absolute;">History</p>
			</div>
			<div class="newitem"
				style="margin-top: 10px; background-color: transparent; box-shadow: none; height: 1000px;">
				<%
					int i = 0;
						while (rs.next()) {

							String status = rs.getString("status");
							String bookname = rs.getString("bookname");
							ResultSet rs2 = stmt2
									.executeQuery("select  bookimagepath,bookauthor from books_information where bookname='"
											+ bookname + "'");
							rs2.next();
							i = 1;
							if (status.equals("Issue")) {
				%>
				<div class="timelineitem"
					style="width: 450px; height: 220px; margin-left: 800px;">
					<div class="timeline">
						<div class="stick"></div>

						<div class="triangle"></div>
						<div class="content2">
							<div class="contentheading">
								<p
									style="font-family: 'Carrois Gothic SC', sans-serif; font-size: 24px; float: left;"><%=rs.getString("date")%>
								</p>
								<div class="status2"
									style="width: 100px; height: 30px; background-color: #00b190; float: left; margin-left: 160px; color: white; text-align: center; border-radius: 8%; border: 1px solid; padding-top: 5px;">Issue</div>
							</div>
							<div class="contentimg">
								<img alt="" src="<%=rs2.getString("bookimagepath")%>"
									style="width: 130px; height: 110px; border: 4px solid #e3e3e3; margin: 15px; float: left;">
							</div>
							<p
								style="float: left; margin: 20px; font-family: 'Carrois Gothic SC', sans-serif; max-width: 200px; font-size: 28px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=bookname%></p>
							<p
								style="float: left; margin: 20px; font-family: 'Carrois Gothic SC', sans-serif; font-size: 20px; max-width: 200px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=rs2.getString("bookauthor")%></p>
							<div class="contentdetails"></div>

						</div>
					</div>
				</div>
				<%
					} else if (status.equals("Return")) {
				%>

				<div class="timelineitemleft"
					style="width: 450px; height: 220px; margin-left: 355px;">
					<div class="timeline">
						<div class="stickleft"></div>
						<div class="triangleleft"></div>
						<div class="content2left">
							<div class="contentheading">
								<p
									style="font-family: 'Carrois Gothic SC', sans-serif; font-size: 24px; float: left;"><%=rs.getString("date")%>
								</p>
								<div class="status2"
									style="width: 100px; height: 30px; background-color: #00b190; float: left; margin-left: 160px; color: white; text-align: center; border-radius: 8%; border: 1px solid; padding-top: 5px;">Return</div>
							</div>
							<div class="contentimg">
								<img alt="" src="<%=rs2.getString("bookimagepath")%>"
									style="width: 130px; height: 110px; border: 4px solid #e3e3e3; margin: 15px; float: left;">
							</div>
							<p
								style="float: left; margin: 20px; font-family: 'Carrois Gothic SC', sans-serif; font-size: 28px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width: 200px;"><%=rs.getString("bookname")%></p>
							<p
								style="float: left; margin: 20px; font-family: 'Carrois Gothic SC', sans-serif; font-size: 20px; max-width: 200px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><%=rs2.getString("bookauthor")%></p>
						</div>
					</div>
				</div>

				<%
					}

						}
						if (i == 0) {%>
							<div style="width:900px;border-radius:2%;height:80px;background-color:#f2dede;color:#a94442;text-align: center;padding: 10px;margin: auto;"><p style="font-size:32px;padding-top:20px;">No History</p>
				        	<p>Please get books issued to get history </p></div>
					<%	}
				%>




			</div>
		</div>


	</div>
</body>
</html>
<%}
else{
	response.sendRedirect("Login.jsp");
}%>