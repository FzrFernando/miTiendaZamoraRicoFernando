<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Category</title>
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	String login = (String) sesion.getAttribute("isLogin");
	String user = (String) sesion.getAttribute("usuario");
	
	if (login != null && user != null && login.equals("True")) {
	%>
	<form action="addCategoryHecho.jsp" method="post">
		<h2>¿Qué categoría desea añadir?</h2>
		Name: <input type="text" id="name" name="name" required><br><br>
		Description: <input type="text" id="description" name="description" required><br><br>
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