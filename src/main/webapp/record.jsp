<%@page import="miTiendaZamoraRicoFernando.logica.User"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.UserDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Historial de Compras</title>
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	String login = (String) sesion.getAttribute("isLogin");
	String user = (String) sesion.getAttribute("usuario");
	Cart listCart = (Cart) sesion.getAttribute("carrito");
	if (login != null && user != null & login.equals("True")){
		UserDAO ud = new UserDAO();
		User u = ud.findUser(user);
	%>
		<p>
			<%=u.getPurchase()%>
		</p>
	<%
	} else {
		response.sendRedirect("error.jsp?msg=No estás logueado");
	}
	%>
</body>
</html>