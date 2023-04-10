<%@page import="miTiendaZamoraRicoFernando.accesoDatos.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Category</title>
</head>
<body>
	<% 
	int id = Integer.parseInt(request.getParameter("id"));
	CategoryDAO cd = new CategoryDAO();
	if (cd.deleteCategory(cd.findCategory(id))) {
		response.sendRedirect("exito.jsp?msg=La categoría ha sido eliminada con éxito");
	} else {
		response.sendRedirect("error.jsp?msg=Ha ocurrido un error inesperado");
	}
	%>
</body>
</html>