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
	<header>
		<div class="header" align="center">
			<h1>Classroom</h1>
		</div>
	</header>
	<hr>
	<main>
		<div align="center">
			<%
				session.setAttribute("session", "FALSE");
				
			%>
			<div class="message" align="center">
			You have logged out successfully!
			</div>
			<hr width="50%">
			
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