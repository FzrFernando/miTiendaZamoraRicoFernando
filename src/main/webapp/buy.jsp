<%@page import="miTiendaZamoraRicoFernando.logica.User"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.UserDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Purchase"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.PurchaseDAO"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.ProductDAO"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Product"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Compra</title>
</head>
<body>
<%
HttpSession sesion = request.getSession();
String login = (String) sesion.getAttribute("isLogin");
String user = (String) sesion.getAttribute("usuario");
if (login != null && user != null & login.equals("True")){
	Cart c = (Cart) sesion.getAttribute("carrito");
	for (Product p:c.getKeyCart()){
		int cant = c.getUnit(p);
		if (p.getStock() < cant){
			p.setStock(p.getStock()-cant);
			ProductDAO pd = new ProductDAO();
			pd.addAndEditProduct(p);
			LocalDate date = LocalDate.now();
			UserDAO ud = new UserDAO();
			User u = ud.findUser(user);
			Purchase pur = new Purchase(u,p,cant,p.getPrice(),date);
			PurchaseDAO purd = new PurchaseDAO();
			purd.addPurchase(pur);
			
		}
		else{
			throw new Exception("El stock es menor que la cantidad que pides");
		}
		response.sendRedirect("exito.jsp?msg=Compra realizada");
	}
} else {
	response.sendRedirect("error.jsp?msg=No estás logueado");
}
%>
</body>
</html>