<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Category"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	String login = (String) sesion.getAttribute("isLogin");
	String user = (String) sesion.getAttribute("usuario");
	
	if (login != null && user != null && login.equals("True")) {
	%>
	<form action="addHecho.jsp" method="post">
		<h2>¿Cuál es el producto que desea añadir?</h2>
		Name: <input type="text" id="name" name="name" required><br><br>
		Description: <input type="text" id="description" name="description" required><br><br>
		Stock: <input type="number" id="stock" name="stock" required><br><br>
		Price: <input type="number" id="price" name="price" step="any" required><br><br>
		Category:
			<select name="category" id="category">
			<% 
			CategoryDAO cd = new CategoryDAO();
			List<Category> list = cd.returnCategory();
			for (Category c : list) {
			%>
				<option value="<%=c.getId()%>"><%=c.getName()%></option>
			<% 
			}
			%>
			</select>
		<input type="submit" id="boton" name="boton" value="Add">
	</form>
	
	<a href="main.jsp">
		<button>
			Cancelar
		</button>	
	</a>
	<%
	} else {
		response.sendRedirect("error.jsp?msg=No estás logueado");
	}
	%>
</body>
</html>