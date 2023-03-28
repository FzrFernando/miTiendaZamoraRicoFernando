<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exito</title>
</head>
<body>
	<%
	String msg = request.getParameter("msg");
	out.println(msg);
	%>
	<a href="mainCategory.jsp">
		<button>Volver al Main</button>
	</a>
</body>
</html>