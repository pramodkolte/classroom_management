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

		<jsp:useBean id="objt" class="pojo.User" />
		<jsp:setProperty property="*" name="objt" />
		<%
			int emailResult= Operations.checkEmail(objt.getEmail());
			int usernameResult= Operations.checkUsername(objt.getUsername());
			if(emailResult==0 && usernameResult==0){
				int result=Operations.registerUser(objt);
				int checkEmailResult= Operations.checkEmail(objt.getEmail());
				if(checkEmailResult==1){
				out.println("Your details are registered successfully,");
				out.println("Go to Log in!");
				
				}
				else{
					out.println("Try again!");
				}
			}
			else if(emailResult!=0){
				out.println("Email already exist!");
				out.println("Try with different email or log in!");
			}
			else if(usernameResult!=0){
				out.println("This username is not available!");
				out.println("Try again!");
			}
		%>
	</div>
	<hr width="50%">
	<main>
		<div align="center">



			<form action="register.jsp" method="post">
				<table>
					<tr>
						<td>First Name</td>
						<td><input type="text" name="fname" required
							onclick="this.value=''" /></td>
					</tr>
					<tr>
						<td>Last Name</td>
						<td><input type="text" name="lname" required
							onclick="this.value=''" /></td>
					</tr>
					<tr>
						<td>UserName</td>
						<td><input type="text" name="username" required
							onclick="this.value=''" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" required
							onclick="this.value=''" /></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="email" name="email" required
							onclick="this.value=''" /></td>
					</tr>
					<tr>
						<td>Contact No</td>
						<td><input type="text" name="contact" required placeholder="1234567890"
							pattern="[1-9]{1}[0-9]{9}" onclick="this.value=''" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Sign Up" /></td>
					</tr>
				</table>

			</form>

		</div>
		<div align="center">
		<h3>Already have Account! <a href="home.jsp">Log in</a></h3>
		</div>

	</main>

</body>
</html>