<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Iniciar Sesión</title>
</head>
<body>
	<%session.invalidate();%>
	<h1>Tienda de Fernando</h1>
	<h3>Log In</h3>
	<form action="login.jsp" method="get">
		<label>Usuario</label> 
		<input type="text" id="usuario" name="usuario" required> <br> 
		<label>Contraseña</label> 
		<input type="password" id="contrasena" name="contrasena" required> 
		<input type="submit" value="Iniciar Sesión">
	</form>
	<a href="register.jsp">
		<button>Registrate</button>
	</a>
</body>
</html>