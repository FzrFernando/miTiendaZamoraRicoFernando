<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<% 
	String login = request.getParameter("usuario");
	String password = request.getParameter("contrasena");
	
	UserDAO ud = new UserDAO();
	if (!ud.validateUser(login, password)){
		response.sendRedirect("ErrorLogin");
	}
	else{
		HttpSession sesion = request.getSession();
		sesion.setAttribute("isLogin", "True");
		sesion.setAttribute("usuario", login);
		response.sendRedirect("mainCategory.jsp");
	}
	%>
</body>
</html>