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
	HttpSession sesion = request.getSession();
	String login = (String) sesion.getAttribute("isLogin");
	String user = (String) sesion.getAttribute("usuario");
	if (login != null && user != null & login.equals("True")) {
		Category c;
		CategoryDAO cd = new CategoryDAO();
		c = cd.findCategory(Integer.parseInt(request.getParameter("id")));
	%>
	<form action="updateCategoryHecho.jsp" method="post">
		<h2>¿Cómo desea actualizar el producto?</h2>
		<input type="hidden" id="code" name="code" value="<%=c.getId()%>"><br><br>
		Name: <input type="text" id="name" name="name" value="<%=c.getName()%>" required><br><br>
		Description: <input type="text" id="description" name="description" value="<%=c.getDescription()%>" required><br><br>
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