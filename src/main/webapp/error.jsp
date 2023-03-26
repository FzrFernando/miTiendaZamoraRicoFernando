<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
</head>
<body>
	<%
	String msg = request.getParameter("msg");
	out.println(msg);
	%>
	<a href="index.jsp">
		<button>Iniciar Sesión</button>	
	</a>
</body>
</html>