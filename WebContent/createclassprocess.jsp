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
	<jsp:useBean id="obj2" class="pojo.Classroom" />
	<jsp:setProperty property="*" name="obj2" />
	<%
		if (session.getAttribute("session") == "false") {
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
			<a href="userhome.jsp"><button>Home</button></a>
			<a href="createclass.jsp"><button>Create Class</button></a>
			<a href="joinclass.jsp"><button>Join Class</button></a>
			 <a href="userprofile.jsp"><button>My Profile</button></a>
		</div>
	</header>
	
	<main>
		<div align="center">

			<h3>Fill the details to create class!</h3>
			<div class="message" align="center">
			<%
				int result = Operations.checkClassid(obj2.getClassid());
				if (result != 0) {
					out.println("This classid not available!");
					out.println("Try another classid!");
				} else if (result == 0) {
					Operations.registerClass(obj2.getClassid(), obj2.getClassname(), useremail);
					out.println("Class created successfully!");
					out.println("Go to home page!");
				}
			%>
			</div>
			<form action="createclassprocess.jsp" method="post">
				<table>
					<tr>
						<td>Class id</td>
						<td><input type="text" name="classid" required
							onclick=this.vaue /></td>
					</tr>
					<tr>
						<td>Class Name</td>
						<td><input type="text" name="classname" required
							onclick=this.vaue /></td>
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