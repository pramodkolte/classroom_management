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
				href="createclass.jsp"><button>Create Class</button></a>
				<a href="joinclass.jsp"><button>Join Class</button></a> <a
				href="userprofile.jsp"><button>My Profile</button></a> 

		</div>
	</header>
	
	<main>
		<div align="center">
			<p>
				<b>Name : </b>
				<%
					out.println(user.getFname() + " " + user.getLname());
				%>
			</p>
			<p>
				<b>Username : </b>
				<%
					out.println(user.getUsername());
				%>
			</p>
			<p>
				<b>Email : </b>
				<%
					out.println(useremail);
				%>
			</p>
			<p>
				<b>Contact No : </b>
				<%
					out.println(user.getContact());
				%>
			</p>
		</div>
		<hr width="50%">
		<div align="center">
		<a href="logout.jsp"><button>Log out</button></a>
		</div>
	</main>
</body>
</html>