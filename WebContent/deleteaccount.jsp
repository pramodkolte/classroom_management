<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Classroom</title>
</head>
<body>
<%
if(session.getAttribute("session")=="false"){
	response.sendRedirect("home.jsp");
}
%>
</body>
</html>