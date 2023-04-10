<%@page import="java.util.Date"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.UserDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<%
	String usuario = "", password = "", name = "";
	Date birthdate = null;
	char sex = ' ';
	boolean admin = false;
	
	if (request.getParameter("nameuser") != null){
		usuario = request.getParameter("nameuser");
	} else {
		response.sendRedirect("error.jsp?msg=El campo usuario es obligatorio");
	}
	
	if (request.getParameter("password") != null) {
		password = request.getParameter("password");
	} else {
		response.sendRedirect("error.jsp?msg=El campo password es obligatorio");
	}
	
	if (request.getParameter("name") != null) {
		name = request.getParameter("name");
	} else {
		response.sendRedirect("error.jsp?msg=El campo nombre es obligatorio");
	}
	
	if (request.getParameter("birthdate") != null) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		birthdate = format.parse(request.getParameter("birthdate"));
	} else {
		response.sendRedirect("error.jsp?msg=El campo fecha de nacimiento es obligatorio");
	}
	
	if (request.getParameter("sex") != null) {
		sex = request.getParameter("sex").charAt(0);
	} else {
		response.sendRedirect("error.jsp?msg=El campo sexo es obligatorio");
	}
	
	User u = new User(usuario,password,name, birthdate, sex, admin);
	UserDAO ud = new UserDAO();
	ud.addUser(u);
	
	response.sendRedirect("exito.jsp?msg=Te has registrado con éxito");
	%>
</body>
</html>