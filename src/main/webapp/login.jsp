<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.UserDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.User" %>
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
	/*Mirar si el usuario y contraseña que no sean nulos*/
	if (login != null || password != null) {
		UserDAO ud = new UserDAO();
		if (!ud.validateUser(login, password)){
			response.sendRedirect("ErrorLogin");
		}
		else{
			HttpSession sesion = request.getSession();
			sesion.setAttribute("isLogin", "True");
			sesion.setAttribute("usuario", login);
			User u = ud.findUser(login);
			sesion.setAttribute("admin", u.isAdmin());
			HashMap <Object, Integer> carro = new HashMap <Object, Integer> ();
			sesion.setAttribute("carrito", carro);
			response.sendRedirect("mainCategory.jsp");
		}
	}
	else {
		response.sendRedirect("ErrorLogin");
	}
	%>
</body>
</html>