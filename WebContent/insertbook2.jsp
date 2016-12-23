<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@page import="java.sql.*"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>

	<%
	
	Statement st = null;
	Connection cn = null;
	Class.forName("com.mysql.jdbc.Driver");
	cn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/users", "root", "password");
	st = cn.createStatement();
	ResultSet rs=st.executeQuery("select DISTINCT bookcategory from books_information ");
%>

<html>
<head>

<link href="bootstrap.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-responsive.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="bootstrap.min.js"></script>
<link href="librariandashboard.css" type="text/css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Carrois+Gothic+SC'
	rel='stylesheet' type='text/css'>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

</head>

<body>
	<div class="header1">
		<img src="images/thumb 4.png" width="130" height="30" />
		<form class="form-search" action="search.jsp" method="post"
			style="margin-left: 760px; margin-top: -48px;">
			<div class="input-append">
				<input type="text" class="span2 search-query"
					style="width: 400px;height:30px; background-color: #00987b; border-color: #00987b; color: white;"
					placeholder="search by bookname" name="book">
				<button type="submit" class="btn" style="">Search</button>
			</div>

		</form>
		<span
			style="color: white; float: right; margin-top: -50px; margin-right: 200px;">Hello!!</span>
		<a href="Logout.jsp"><img alt="" src="images/exit-48.png"
			style="color: white; float: right; margin-top: -60px; margin-right: 100px;" /></a>
	</div>
	<div class="content">
		<div class="leftnav">
			
			<a href="librariandashboard.jsp" style="text-decoration: none;">
				<div class="icons">
					<div id="bgimg"></div>
					<p class="imgcaption">ISSUES</p>
				</div>
			</a> <a href="insertbook2.jsp" style="text-decoration: none;">
				<div class="icons">
					<div id="bgimg5"></div>
					<p class="imgcaption" style="margin: -5px 10px;">ADDBOOK</p>
				</div>
			</a>
		
		
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
					style="margin-left: 700px; margin-top: 18px; position: absolute;">
					<img alt="" src="images/book-32.png" style="padding-right: 10px;">Add Book
				</p>
			</div>

			<div class="newitem"
				style="margin-top: 10px; height: auto; padding: 20px; width: 1620px;">
				<form name="form1" method="post" enctype="multipart/form-data"
					action="insertbook2.jsp">
					<table  style="margin: auto;">
						<tr>
							<td>Book Name:</td>
							<td><input type="text" name="name" id="name" /></td>
						</tr>
						<tr>
							<td>Book ID:</td>
							<td><input type="text" name="id" id="id" /></td>
						</tr>
						<tr>
							<td>Book Author:</td>
							<td><input type="text" name="author" id="author" /></td>
						</tr>
						<tr>
							<td>Book Category:</td>
							<td><select name="category" id="category">
							<%while(rs.next()){%>
							<option value="<%=rs.getString("bookcategory")%>"><%=rs.getString("bookcategory")%></option>
							<%} %>
							</select></td>
						</tr>
						<tr>
							<td>Book Image:</td>
							<td><input type="file" name="ImageFile" id="ImageFile" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" name="submit" value="submit" />
					</table>
				</form>
				<% 
	try {
		String ImageFile = "";
		String itemName = "";
		String bookName = "";
		String bookId = "";
		String bookAuthor = "";
		String bookCategory = "";
		String bookPath = "";
		boolean isMultipart = ServletFileUpload
				.isMultipartContent(request);
		if (!isMultipart) {
		} else {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.getMessage();
			}
			Iterator itr = items.iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString();
					if (name.equals("ImageFile")) {
						ImageFile = value;
					}
					if (name.equals("name")) {
						bookName = value;
					}
					if (name.equals("id")) {
						bookId = value;
					}
					if (name.equals("author")) {
						bookAuthor = value;
					}
					if (name.equals("category")) {
						bookCategory = value;
					}
				} else {
					try {
						itemName = item.getName().substring(
								item.getName().lastIndexOf("\\") + 1);
						File savedFile = new File(
								"C:\\Users\\sannamga\\workspace2\\OLMS\\WebContent\\images\\"
										+ itemName);
						bookPath = "images//" + itemName;
						System.out.println(bookPath);
						item.write(savedFile);
					} catch (Exception e) {
						//out.println("Error" + e.getMessage());
					}
				}
			}
			try {
				System.out.println(bookCategory);
				System.out.println(bookId);
			 	if((bookId).equals("")||(bookName).equals("")||(bookPath).equals(""))
	        	{%>
	        	<div style="width:900px;border-radius:2%;height:80px;background-color:#f2dede;color:#a94442;text-align: center;padding: 10px;margin: auto;"><p style="font-size:32px;padding-top:20px;">MISSING FIELDS</p>
	        	<p>Please check the fields properly</p></div>
	        	<% 
			 		//out.println("fileds are missing");
	              
	        	}
	        	else	{    
	        		%>
		        	<div style="width:900px;border-radius:2%;height:80px;background-color:#fcf8e3;color:#8a6d3b;text-align: center;padding: 10px;margin: auto;"><p style="font-size:32px;padding-top:20px;">Success</p>
		        	<p>Book has been added</p></div>
		        	<% 
	        		st.executeUpdate("insert into books_information(bookcategory, bookid, bookname, bookauthor, bookimagepath) values ('"+bookCategory+"','"+bookId+"','"+bookName+"','"+bookAuthor+"','"+bookPath+"')");}
			} catch (Exception el) {
				out.println("Inserting error" + el.getMessage());
			}
		}
	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>
			</div>
		</div>


	</div>

</body>
</html>
