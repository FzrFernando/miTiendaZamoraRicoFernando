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
		Boolean admin = (Boolean) sesion.getAttribute("admin");
		if (admin == true){
	%>
	<a href="addCategory.jsp">Add Category</a>
	<%	
		}
	%>
	
	<a href="main.jsp">Show All Products</a>
	<a href="index.jsp">Close Session</a>
	<!--El usuario administrador podrá añadir, editar y borrar, todos los usuarios podrán comprar-->
	<table border="1">
		<thead>
			<tr>
				<th>Code</th>
				<th>Name</th>
				<th>Description</th>
				<th>Products</th>
				<%
				if (admin == true) { 
				%>
				<th>Actions</th>
				<%
				}
				%>
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
			<td><a href="main.jsp?category=<%=c.getId()%>">Ver productos</a></td>
			<% 
			if (admin == true) { 
			%>
			<td>
				<a href="updateCategory.jsp?id=<%=c.getId()%>">Update</a>
				<a href="deleteCategory.jsp?id=<%=c.getId()%>">Delete</a>
			</td>
			<%
			} 
			%>
		</tr>
	</tbody>
	<%	
	}
	%>
	</table>
	<% 
	} else {
		response.sendRedirect("error.jsp?msg=No estás logueado");
	}
	%>
</body>
</html>