<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
		String Role=(String) session.getAttribute("role");
String pending=request.getParameter("pending");
		if(Role.equals("librarian")){
		%>
			
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
			<a href="librariandashboard.jsp" style="text-decoration: none;">
				<div class="icons">
					<div id="bgimg"></div>
					<p class="imgcaption">ISSUES</p>
				</div>
				  <a href="insertbook2.jsp" style="text-decoration: none;">
                <div class="icons">
                    <div id="bgimg5"></div>
                    <p class="imgcaption" style="margin: -5px 24px;">ADD BOOK</p>
                </div>
            </a>
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
			
		</div>

		<div class="maincontent">
			<div class="heading">
				<p class="subheading"
					style="margin-left: 700px; margin-top: 18px; position: absolute;">Issue
					And Returns</p>
			</div>

			<div class="newitem" style="margin-top: 10px;">
				  <form action="grant.jsp" method="post" class="form-horizontal" style="margin-left:620px;position: absolute;font-family: 'Carrois Gothic SC', sans-serif;">
					<div class="control-group" style="margin-top:20px;">
						<label class="control-label" for="inputEmail">Book Name</label>
						<div class="controls">
							 <select name="book">
                                <option>select book </option>
                                <%
							        Class.forName("com.mysql.jdbc.Driver");
							        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "password");
							        Statement stmt=conn.createStatement();
							        ResultSet rs=stmt.executeQuery("select  bookid, bookname from books_information");
							        
							        while(rs.next()){
							            String bookid= rs.getString("bookid");
							            String bookname= rs.getString("bookname");
							             %><option value=<%=bookid%>><%=bookid+"-"+bookname %></option><%
							        }
							      %>
                         </select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputPassword">Student Name</label>
						<div class="controls">
							<select name="user">
						        <option>select user </option>
						        <%
						               ResultSet rs2=stmt.executeQuery("select * from users where role='student'");
						               while(rs2.next()){
						                    String userid= rs2.getString("userid");
						                     %><option value=<%=userid%>><%=userid%></option><%
						                }
						         %>
                        </select>
						</div>
					</div>
					<div class="control-group">
                        <div class="controls">
                            <label class="radio"> <input type="radio" name = "issuereturn" value="Issue" height="20">
                                Issue
                            </label>
                            <label class="radio"> <input type="radio" name = "issuereturn" value="Return">
                                Return
                            </label>
                            
                            <button type="submit" style="background-color: #E3E3E3; border:2px solid #E3E3E3;margin-top:30px;
                             width:240px;height:60px;border-radius:4%;font-size:24px;color:#00b190;font-family: 'Carrois Gothic SC', sans-serif;">Proceed</button>
                        </div>
                    </div>
                    <%
                   if(pending!=null){ if(pending.equals("successissue")){%>
                    	<div style="width:900px;border-radius:2%;height:50px;background-color:#fcf8e3;color:#8a6d3b;text-align: center;padding: 10px;margin-left:400px;;"><p style="font-size:32px;padding-top:20px;">success issue</p>
			        	</div>
                    <%}
                    if(pending.equals("failedIssue")){%>
                	<div style="width:900px;border-radius:2%;height:50px;background-color:#f2dede;color:#a94442;text-align: center;padding: 10px;margin-left:-180px;"><p style="font-size:32px;padding-top:20px;">failed issue</p>
		        	</div>
                <%}if(pending.equals("successreturn")){%>
            	<div style="width:900px;border-radius:2%;height:50px;background-color:#fcf8e3;color:#8a6d3b;text-align: center;padding: 10px;margin-left:-180px;"><p style="font-size:32px;padding-top:20px;">success return</p>
	        	</div>
            <%}if(pending.equals("failedReturn")){%>
        	<div style="width:900px;border-radius:2%;height:50px;background-color:#f2dede;color:#a94442;text-align: center;padding: 10px;margin-left:-180px;">
        	<img src="images/inbox.png"/>
        	<p style="font-size:32px;padding-top:20px;">failed return</p>
        	</div>
        <%}
                   }    %>
					</div>
				</form>
			</div>
		</div>


	</div>
	<%}
		
	else{response.sendRedirect("Login.jsp");}%>
</body>
</html>