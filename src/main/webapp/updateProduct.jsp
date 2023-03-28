<%@page import="java.util.List"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.CategoryDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Category"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.ProductDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	String login = (String) sesion.getAttribute("isLogin");
	String user = (String) sesion.getAttribute("usuario");
	if (login != null && user != null & login.equals("True")) {
		Product p;
		ProductDAO pd = new ProductDAO();
		p = pd.findProduct(Integer.parseInt(request.getParameter("id")));
	%>
	<form action="updateHecho.jsp" method="post">
		<h2>¿Cómo desea editar el producto?</h2>
		<input type="hidden" id="code" name="code" value="<%=p.getCode()%>"><br><br>
		Name: <input type="text" id="name" name="name" value="<%=p.getName()%>" required><br><br>
		Description: <input type="text" id="description" name="description" value="<%=p.getDescription()%>" required><br><br>
		Stock: <input type="number" id="stock" name="stock" value="<%=p.getStock()%>" required><br><br>
		Price: <input type="number" id="price" name="price" step="any" value="<%=p.getPrice()%>" required><br><br>
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
		<input type="submit" id="boton" value="Update">
	</form>
	
	<a href="main.jsp">
		<button>Cancelar</button>
	</a>
	<% 
	} else {
		response.sendRedirect("error.jsp?msg=No estás logueado");
	}
	%>
</body>
</html>