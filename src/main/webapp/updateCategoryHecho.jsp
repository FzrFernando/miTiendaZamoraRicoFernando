<%@page import="miTiendaZamoraRicoFernando.accesoDatos.CategoryDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Category</title>
</head>
<body>
	<%
	String name = "", description = "";
	
	if (request.getParameter("name") != null) {
		name = request.getParameter("name");
	} else{
		response.sendRedirect("error.jsp?msg=El campo nombre es obligatorio");
	}
	
	if (request.getParameter("description") != null) {
		description = request.getParameter("description");
	} else {
		response.sendRedirect("error.jsp?msg=El campo descripción es obligatorio");
	}
	
	Category c = new Category(name, description);
	Integer code = Integer.parseInt(request.getParameter("code"));
	c.setId(code);
	CategoryDAO cd = new CategoryDAO();
	cd.addAndEditCategory(c);
	
	response.sendRedirect("exito.jsp?msg=La categorñia ha sido actualizada con éxito");
	%>
</body>
</html>