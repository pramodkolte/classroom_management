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
		if (session.getAttribute("session") != "TRUE") {
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

			<h3>Fill the details to create class!</h3>

			<form action="createclassprocess.jsp">
				<table>
					<tr>
						<td>Class id</td>
						<td><input type="text" name="classid" required
							onclick=this.value /></td>
					</tr>
					<tr>
						<td>Class Name</td>
						<td><input type="text" name="classname" required
							onclick=this.value /></td>
					</tr>
					<tr>
						<td>Class Teacher</td>
						<td>:<%
							out.println(useremail);
						%>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Create Class" /></td>
					</tr>
				</table>

			</form>

		</div>
	</main>
</body>
</html>