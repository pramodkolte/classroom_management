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
	<%@page import="java.util.ArrayList"%>
	<%@page import="blogic.Operations"%>
	<%@page import="pojo.User"%>
	<%@page import="pojo.Classroom"%>
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
		<hr>
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
	<hr>
	<main>
		<div align="center">
			<h3>Join Class</h3>
		</div>
		<div align="center">
			<h5>Enter Class ID to search!</h5>
			<form
				action="searchclass.jsp?classid=<%=request.getParameter("classid")%>">
				<input type="text" name="classid" required onclick="this.value">
				<button type="submit">Search</button>
			</form>
		</div>
		<hr>
		<div>
			<p>
				Search result for "<%
				out.println(request.getParameter("classid"));
			%>"
			</p>
			<div class="message" align="center">
			<%
				ArrayList<Classroom> classlist = new ArrayList<Classroom>();
					classlist = Operations.getClasses(request.getParameter("classid"));
					if (classlist.size() == 0) {
						out.println("No result found!");
					}
			%>
			</div>
			<ol>
				<%
					for (int i = 0; i < classlist.size(); i++) {
				%>
				<li><h4>
						<%
							out.println(classlist.get(i).getClassname());
						%>
					</h4>
					<h5>
						Class Teacher :
						<%
						String teacher = (classlist.get(i).getClassteacher());
							User user1 = new User();
							user1 = Operations.getUserDeatails(teacher);
							out.println(user1.getFname() + " " + user1.getLname());
					%>
					</h5> <a href="requestteacher.jsp?classid=<%=classlist.get(i).getClassid() %>">
						<button>Join</button>
				</a></li>

				<%
					}
				%>
			</ol>
		</div>
	</main>
</body>
</html>