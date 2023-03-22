<%@page import="miTiendaZamoraRicoFernando.accesoDatos.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Category"%>
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
			<tr>
				<th>Code</th>
				<th>Name</th>
				<th>Description</th>
				<th>Products</th>
			</tr>
		</thead>
	<% 
	CategoryDAO cd = new CategoryDAO();
	List<Category> list = cd.returnCategory();
	for (Category c : list) {
	%>
	<tbody>
		<tr>
			<th><%=c.getId()%></th>
			<td><%=c.getName()%></td>
			<td><%=c.getDescription()%></td>
			<td><a href="mainProducts.jsp?category=<%=c.getId()%>">Ver productos</a></td>
		</tr>
	</tbody>
	<%	
	}
	%>
	</table>
	<% 
	} else {	
	}
	%>
</body>
</html>