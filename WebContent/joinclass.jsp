<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Classroom</title>
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body>
	<%@page import="blogic.Operations"%>
	<%@page import="pojo.User"%>
	<%
	if (session.getAttribute("session")!= "TRUE") {
		response.sendRedirect("home.jsp");
	}
		String useremail = (String) session.getAttribute("useremail");
		User user = new User();
		user = Operations.getUserDeatails(useremail);
	%>
	<header>
		<div class="header" align="center">
			<h1>Classroom</h1>
		</div>
		
		<div class="actions" align="center">
			Welcome
			<%
			out.println(user.getFname() + " " + user.getLname());
		%>
		</div>
		<div class="actions" align="center">
			<a href="userhome.jsp"><button>Home</button></a> <a
				href="createclass.jsp"><button>Create Class</button></a> <a
				href="joinclass.jsp"><button>Join Class</button></a> <a
				href="userprofile.jsp"><button>My Profile</button></a>
		</div>
	</header>
	
	<main>
		<div align="center">
			<h3>Join Class</h3>
		</div>
		<div align="center">
			<h5>Enter Class ID to search!</h5>
			<form action="searchclass.jsp?classid=<%=request.getParameter("classid")%>">
			<input type="text" name="classid" required onclick="this.value"> 
			<button type="submit">Search</button>
		</form>
		</div>
	</main>
</body>
</html>