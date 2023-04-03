<%@page import="miTiendaZamoraRicoFernando.accesoDatos.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
	<% 
	int id = Integer.parseInt(request.getParameter("id"));
	ProductDAO pd = new ProductDAO();
	if (pd.deleteProduct(pd.findProduct(id))) {
		response.sendRedirect("exito.jsp?msg=El producto ha sido eliminado con éxito");
	} else {
		response.sendRedirect("error.jsp?msg=Ha ocurrido un error inesperado");
	}
	%>
</body>
</html>