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
	<%@page import="pojo.Classroom"%>
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
			<%
				ArrayList<User> studentlist = new ArrayList<User>();
					studentlist = Operations.getStudents(request.getParameter("classid"));
					Classroom classinfo = new Classroom();
					classinfo = Operations.getClassDeatails(request.getParameter("classid"));
			%>
			<h3>
				Class Name :

				<%
				out.print(classinfo.getClassname());
			%>
				<br> Class Teacher :
				<%
					User user1 = new User();
					user1 = Operations.getUserDeatails(classinfo.getClassteacher());
					out.println(user1.getFname() + " " + user1.getLname());
				%>
			</h3>
			<h4>Student List</h4>
			<div class="message" align="center">
			<%
				if (studentlist.size() == 0) {
					out.println("This class is empty!");
				} else {
			%>
			</div>
			<table title="Student List" border="1">
				<tr>
					<th>Number</th>
					<th>Student Name</th>
					<th>Email</th>
					<th>Contact No</th>
				</tr>
				<%
					for (int i = 0; i < studentlist.size(); i++) {
				%>
				<tr>
					<td>
						<%
							out.println(i+1);
						%>
					</td>
					<td>
						<%
							out.println(studentlist.get(i).getFname() + " " + studentlist.get(i).getLname());
						%>
					</td>
					<td>
						<%
							out.println(studentlist.get(i).getEmail());
						%>
					</td>
					<td>
						<%
							out.println(studentlist.get(i).getContact());
						%>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<%
				}
			%>
		</div>
		<div align="center">
			<%
				ArrayList<User> studentlist1 = new ArrayList<User>();
				studentlist1 = Operations.getRequests(request.getParameter("classid"));
			%>
			<div class="message" align="center">
			<%
				if (studentlist1.size() == 0) {
					out.println("No Requests!");
				} else {
			%>
			</div>
			<h4>Student Request List</h4>
			<table title="Student join request List" border="1">
				<tr>
					<th>Number</th>
					<th>Student Name</th>
					<th>Email</th>
					<th>Contact No</th>
					<th>Action</th>
				</tr>
				<%
					for (int i = 0; i < studentlist1.size(); i++) {
				%>
				<tr>
					<td>
						<%
							out.println(i+1);
						%>
					</td>
					<td>
						<%
							out.println(studentlist1.get(i).getFname() + " " + studentlist1.get(i).getLname());
						%>
					</td>
					<td>
						<%
							out.println(studentlist1.get(i).getEmail());
						%>
					</td>
					<td>
						<%
							out.println(studentlist1.get(i).getContact());
						%>
					</td>
					<td><a
						href="acceptrequest.jsp?student=<%= studentlist1.get(i).getEmail() %>&classid=<%= classinfo.getClassid() %>">
							<button>Accept</button>
					</a></td>
				</tr>
				<%
					}
				%>
			</table>
			<%
				}
			%>
		</div>
	</main>
</body>
</html>