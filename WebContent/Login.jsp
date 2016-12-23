<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Library Management System</title>
<link href="bootstrap.css" type="text/css" rel="stylesheet" />
<link href="bootstrap-responsive.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="bootstrap.min.js"></script>
<link href="login.css" type="text/css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.flippy.js"></script>
<link href='http://fonts.googleapis.com/css?family=Carrois+Gothic+SC'
	rel='stylesheet' type='text/css'>

</head>
<body>
	<div class="header_literature1">
		<p ID="SPAN_TITLE">O</p>
		<p class="showme">Open text</p>
	</div>
	<div class="header_literature2">
		<p ID="SPAN_TITLE">L</p>
		<p class="showme">Library</p>
	</div>
	<div class="header_literature3">
		<p ID="SPAN_TITLE">M</p>
		<p class="showme">Management</p>
	</div>
	<div class="header_literature4">
		<p ID="SPAN_TITLE">S</p>
		<p class="showme">System</p>
	</div>
	<div id="board">
		<div class="header_literature"></div>
		<div class="form_elements">
			<h1 class="title-color">Sign In</h1>
			<form action="Check.jsp" method="POST">
				<input type="text" name="userid" id="name" placeholder="Id" /> <input
					type="password" name="password" id="password"
					placeholder="Password" /> <input type="submit"
					class="btn btn-primary btn-lg btn-block" id="submit" value="Log In">
			</form>
			<form action="guest.jsp">
				<input type="submit" class="btn btn-primary btn-lg btn-block"
					id="guest" value="guest" name="guest">
			</form>
			<div id="line"></div>
			<p id="span_reg">
				Not Yet Registered click <a href="Register.jsp">REGISTER</a> to Sign
				up
			</p>
		</div>
	</div>
</body>

</html>