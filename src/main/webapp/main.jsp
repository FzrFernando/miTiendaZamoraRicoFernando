<%@page import="miTiendaZamoraRicoFernando.logica.Cart"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="miTiendaZamoraRicoFernando.logica.Product"%>
<%@page import="java.util.List"%>
<%@page import="miTiendaZamoraRicoFernando.accesoDatos.ProductDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Fernando</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="main.css">
</head>
<body>
	<h1>Tienda de Fernando</h1>
	<% 
	HttpSession sesion = request.getSession();
	String login = (String) sesion.getAttribute("isLogin");
	String user = (String) sesion.getAttribute("usuario");
	Cart listCart = (Cart) sesion.getAttribute("carrito");
	
	if (login != null && user != null & login.equals("True")){
		out.println("Hola " + user);
	%>
	<a href="mainCategory.jsp">Category</a>
	<%
		Boolean admin = (Boolean) sesion.getAttribute("admin");
		if (admin == true){
	%>
	<a href="addProduct.jsp">Add Product</a>
	<% 
		}
	%>
	<a href="index.jsp">Close Session</a>
	
	<div class="cesta">
	<a href="cart.jsp">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16" id="cart">
 		 <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
		</svg>
	</a>
		<p>
		<%=listCart.sizeCart()%>
		</p>
	</div>
	
	<table class="table" border="1">
		<thead>
			<tr>
				<th>Code</th>
				<th>Name</th>
				<th>Description</th>
				<th>Stock</th>
				<th>Price</th>
				<th>Category</th>
				<% 
				if (admin == true) {
				%>
				<th>Actions</th>
				<%
				}
				%>
				<th>Buy</th>
			</tr>
		</thead>
		<% 
		ProductDAO pd = new ProductDAO();
		List<Product> lista;
		if (request.getParameter("category") != null) {
			lista = pd.returnProductCategory(Integer.parseInt(request.getParameter("category")));
		} else {
			lista = pd.returnProduct();
		}
		for (Product p : lista) {
		%>
		<tbody>
			<tr>
				<th><%=p.getCode()%></th>
				<td><%=p.getName()%></td>
				<td><%=p.getDescription()%></td>
				<td><%=p.getStock()%></td>
				<td><%=p.getPrice()%></td>
				<td><%if (p.getCategory() != null) {
						out.println(p.getCategory().getName());
					} else {
						out.println("Sin categoria");
					}%></td>
				<% 
				if (admin == true) {
				%>
				<td>
				<a href="updateProduct.jsp?id=<%=p.getCode()%>">Update</a>
				<a href="deleteProduct.jsp?id=<%=p.getCode()%>">Delete</a>
				</td>
				<%
				}
				%>
				<td>
					<form method="post" action="purchase.jsp">
						<input type="hidden" id="code" name="code" value="<%=p.getCode()%>">
						Amount: <input type="number" name="amount" id="amount" min="1" max="<%=p.getStock()%>">
						<input type="submit" name="compra" id="compra" value="Add to Cart">
					</form>
				</td>
			</tr>
		<% 
		}
		%>
		</tbody>
	</table>
	<%
	} else {
		response.sendRedirect("error.jsp?msg=No estás logueado");
	}
	%>
</body>
</html>