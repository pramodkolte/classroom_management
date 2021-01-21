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
	<main>
		<div class="login" align="center">

			<form action="login.jsp" method="post">
				<table>
					<tr>

						<td>Email</td>
						<td>Password</td>
					</tr>
					<tr>

						<td><input type="email" name="email" required onclick="this.value=''"></td>
						<td><input type="password" name="password" required onclick="this.value=''"></td>
						<td><input type="submit" value="Login">
					</tr>


				</table>

			</form>
		</div>
		<div align="center">
			<h3>Don't have account? Create here!</h3>


			<form action="register.jsp" method="post">
				<table>
					<tr>
						<td>First Name</td>
						<td><input type="text" name="fname" required onclick="this.value=''"/></td>
					</tr>
					<tr>
						<td>Last Name</td>
						<td><input type="text" name="lname" required onclick="this.value=''"/></td>
					</tr>
					<tr>
						<td>UserName</td>
						<td><input type="text" name="username" required onclick="this.value=''"/></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" required onclick="this.value=''"/></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="email" name="email" required onclick="this.value=''"/></td>
					</tr>
					<tr>
						<td>Contact No</td>
						<td><input type="text" name="contact" required placeholder="1234567890"
							pattern="[1-9]{1}[0-9]{9}" onclick="this.value=''"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Sign Up" /></td>
					</tr>
				</table>

			</form>

		</div>
	</main>
</body>
</html>