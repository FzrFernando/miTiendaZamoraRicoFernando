<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<form action="registerHecho.jsp">
		<label>Nombre de usuario</label>
		<input type="text" id="nameuser" name="nameuser" required>
		<br>
		<label>Contraseña</label>
		<input type="password" id="password" name="password" required>
		<br>
		<label>Repita contraseña</label>
		<input type="password" id="confirm_password" name="confirm_password" required>
		<br>
		<label>Nombre</label>
		<input type="text" id="name" name="name" required>
		<br>
		<label>Fecha de Nacimiento</label>
		<input type="date" id="birthdate" name="birthdate" required>
		<br>
		<label>Sexo</label>
		<input type="radio" value="F" id="sex" name="sex" required>
		<input type="radio" value="M" id="sex" name="sex" required>
		<br>
		<input type="submit" value="Registrarse">
	</form>
	<script type="text/javascript">
	var password = document.getElementById("password")
	  , confirm_password = document.getElementById("confirm_password");

	function validatePassword(){
	  if(password.value != confirm_password.value) {
	    confirm_password.setCustomValidity("Passwords Don't Match");
	  } else {
	    confirm_password.setCustomValidity('');
	  }
	}

	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
	</script>
</body>
</html>