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
	<div class="message" align="center">
	
	<%
			String classid=request.getParameter("classid"); 
			Classroom obj=new Classroom();
			obj=Operations.getClassDeatails(classid);
			
			int result=Operations.checkStudent(obj.getClassid(),useremail,"R");
			int result1=Operations.checkStudent(obj.getClassid(),useremail,"A");
			if(result==0 && result1==0){
				Operations.registerRequest(obj.getClassid(),useremail,"R");
				out.println("You have Requested successfuly!");
			}
			else if(result1!=0){
				out.println("You have already joined the class!");
			}
			else if(result!=0){
				out.println("You have already requested to join!");
			}
		%>
	</div>
	</main>
</body>
</html>