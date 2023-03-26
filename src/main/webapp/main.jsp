<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Product"%>
<%@page import="java.util.List"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.ProductDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
	<a href="mainCategory.jsp">Category</a>
	<a href="index.jsp">Close Session</a>
	
	<table border="1">
		<thead>
			<tr>
				<th>Code</th>
				<th>Name</th>
				<th>Description</th>
				<th>Stock</th>
				<th>Price</th>
				<th>Category</th>
			</tr>
		</thead>
		<% 
		ProductDAO pd = new ProductDAO();
		List<Product> lista;
		if (request.getParameter("category") != null) {
			lista = pd.returnProductCategory(Integer.parseInt(request.getParameter("category")));
		} else {
			lista = pd.returnProduct();
		}
		for (Product p : lista) {
		%>
		<tbody>
			<tr>
				<th><%=p.getCode()%></th>
				<td><%=p.getName()%></td>
				<td><%=p.getDescription()%></td>
				<td><%=p.getStock()%></td>
				<td><%=p.getPrice()%></td>
				<td><%if (p.getCategory() != null) {
						out.println(p.getCategory().getName());
					} else {
						out.println("Sin categoria");
					}%></td>
			</tr>
		<% 
		}
		%>
		</tbody>
	</table>
	<%
	} else {
		response.sendRedirect("error.jsp?msg=No estás logueado");
	}
	%>
</body>
</html>