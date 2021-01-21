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
	<hr>
	<header>
		<div class="header" align="center">
			<h1>Classroom</h1>
		</div>
	</header>
	<hr>
	<div class="message" align="center">
		<%@page import="blogic.Operations"%>

		<jsp:useBean id="obj" class="pojo.LoginBean" />
		<jsp:setProperty property="*" name="obj" />
		<%
			int result = Operations.validate(obj);
			if (result == 1) {

				session.setAttribute("session", "TRUE");
				session.setAttribute("useremail", obj.getEmail());
				response.sendRedirect("userhome.jsp");
			} else {
				out.println("Invalid email or password");
				out.println("Please try again!");
			}
		%>
	</div>
	<hr width="50%">
	<main>
		<div align="center">

			<form action="login.jsp" method="post">
				<table>
					<tr>
						<td>Email</td>
						<td>Password</td>
					</tr>
					<tr>
						<td><input type="email" name="email" required
							onclick="this.value=''"></td>
						<td><input type="password" name="password" required
							onclick="this.value=''"></td>
						<td><input type="submit" value="Login">
					</tr>


				</table>

			</form>
		</div>
		<div align="center">
			<h3>
				Don't have Account! <a href="register.jsp">Sign up</a>
			</h3>
		</div>
	</main>
</body>
</html>