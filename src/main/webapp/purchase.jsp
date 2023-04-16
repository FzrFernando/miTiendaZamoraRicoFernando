<%@page import="miTiendaZamoraRicoFernando.logica.Cart"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.ProductDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase</title>
</head>
<body>
	<% 
	HttpSession sesion = request.getSession();
	String login = (String) sesion.getAttribute("isLogin");
	String user = (String) sesion.getAttribute("usuario");
	
	if (login != null && user != null & login.equals("True")){
	%>
	<a href="main.jsp">Back</a>
	<%
	int id = Integer.parseInt(request.getParameter("code"));
	int stock = Integer.parseInt(request.getParameter("amount"));
	ProductDAO pd = new ProductDAO();
	Product p = pd.findProduct(id);
	Cart c = (Cart) sesion.getAttribute("carrito");
	c.addCart(p, stock);
	%>
	<% 
	} else {
		response.sendRedirect("error.jsp?msg=No estás logueado");
	}
	%>
</body>
</html>