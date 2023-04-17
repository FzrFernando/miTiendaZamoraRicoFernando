<%@page import="miTiendaZamoraRicoFernando.logica.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrito</title>
</head>
<body>
<% 
	HttpSession sesion = request.getSession();
	String login = (String) sesion.getAttribute("isLogin");
	String user = (String) sesion.getAttribute("usuario");
	if (login != null && user != null & login.equals("True")){
		Cart c = (Cart) sesion.getAttribute("carrito");
%>
	<p>
		<%=c.getListCart()%>
	</p>
	
	<a href="buy.jsp">
		<button>Comprar</button>
	</a>
	
	<a href="mainCategory.jsp">
		Volver al menú
	</a>
<% 
	} else {
		response.sendRedirect("error.jsp?msg=No estás logueado");
	}
%>
</body>
</html>