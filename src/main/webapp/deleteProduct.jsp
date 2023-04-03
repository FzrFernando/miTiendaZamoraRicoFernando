<%@page import="miTiendaZamoraRicoFernando.accesoDatos.ProductDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Product</title>
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	String login = (String) sesion.getAttribute("isLogin");
	String user = (String) sesion.getAttribute("usuario");
	
	if (login != null && user != null && login.equals("True")) {
		
		Product p;
		ProductDAO pd = new ProductDAO();
		p = pd.findProduct(Integer.parseInt(request.getParameter("id")));
		%>
		<p>Vas a eliminar este producto, ¿estás seguro?</p>
		<% 
		out.print(p.toString());
		%>
	<a href="delHecho.jsp?id=<%=p.getCode()%>">
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