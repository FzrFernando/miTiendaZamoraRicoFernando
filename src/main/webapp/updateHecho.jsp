<%@page import="miTiendaZamoraRicoFernando.accesoDatos.ProductDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Product"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.CategoryDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update</title>
</head>
<body>
	<%
	CategoryDAO cd = new CategoryDAO();
	String name = "", description = "";
	int stock = 0;
	double price = 0.0;
	Category c = null;
	
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
	
	if (request.getParameter("stock") != null) {
		stock = Integer.parseInt(request.getParameter("stock"));
	} else {
		response.sendRedirect("error.jsp?msg=El campo stock es obligatorio");
	}
	
	if (request.getParameter("price") != null) {
		price = Double.parseDouble(request.getParameter("price"));
	} else {
		response.sendRedirect("error.jsp?msg=El campo precio es obligatorio");
	}
	
	if (request.getParameter("category") != null) {
		c = cd.findCategory(Integer.parseInt(request.getParameter("category")));
	} else {
		response.sendRedirect("error.jsp?msg=El campo categoría es obligatorio");
	}
	
	Product p = new Product(name, description, stock, price, c);
	Integer code = Integer.parseInt(request.getParameter("code"));
	ProductDAO pd = new ProductDAO();
	pd.updateProduct(p, code);
	
	response.sendRedirect("exito.jsp?msg=El producto ha sido añadido con éxito");
	%>
</body>
</html>