<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tienda Fernando</title>
</head>
<body>
	<h1>Tienda de Fernando</h1>
	<% 
	HttpSession sesion = request.getSession();
	String login = (String) sesion.getAttribute("isLogin");
	String user = (String) sesion.getAttribute("usuario");
	
	if (login != null && user != null & login.equals("True")){
		out.println("Hola " + user);
	%>
	<a href="index.jsp">Close Session</a>
	<!--El usuario administrador podrá añadir, editar y borrar, todos los usuarios podrán comprar-->
	<table border="1">
		<thead>
			<th></th>
		</thead>
	</table>
	<% 
	} else {	
	}
	%>
</body>
</html>