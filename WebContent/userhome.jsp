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
			<h3>My Classes</h3>
			<div class="message" align="center">
			<%
				ArrayList<Classroom> classlist = new ArrayList<Classroom>();
					classlist = Operations.getTeacherClasses(useremail);
					if (classlist.size() == 0) {
						out.println("You have not created any classes!");
					}
			%>
			</div>
			
				<%
								for (int i = 0; i < classlist.size(); i++) {
							%>
				<h4>
						<a href="myclass.jsp?classid=<%=classlist.get(i).getClassid()%>">
						<button>	<%
		out.println(classlist.get(i).getClassname());
	%></button>
						</a>
					</h4>

				<%
					}
				%>
			
		</div>
		<div align="center">
			<h3>Joined Classes</h3>
			<div class="message" align="center">
			<%
				ArrayList<Classroom> classlist1 = new ArrayList<Classroom>();
					classlist1 = Operations.getStudentClasses(useremail);
					if (classlist1.size() == 0) {
						out.println("You have not joined any classes!");
					}
			%>
			</div>
			<ol>
				<%
					for (int i = 0; i < classlist1.size(); i++) {
				%>
				<li>
					<%
						out.println(classlist1.get(i).getClassname());
					%>
				</li>
				<%
					}
				%>
			</ol>
		</div >

	</main>
</body>
</html>