<%@page import="miTiendaZamoraRicoFernando.accesoDatos.CategoryDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Category"%>
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
	HttpSession sesion = request.getSession();
	String login = (String) sesion.getAttribute("isLogin");
	String user = (String) sesion.getAttribute("usuario");
	
	if (login != null && user != null && login.equals("True")) {
		Category c;
		CategoryDAO cd = new CategoryDAO();
		c = cd.findCategory(Integer.parseInt(request.getParameter("id")));
	%>
	<p>Vas a eliminar esta categoría, ¿estás seguro?</p>
		<% 
		out.print(c.toString());
		%>
	<a href="deleteCategoryHecho.jsp?id=<%=c.getId()%>">
		<button>Eliminar</button>
	</a>
	
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