

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

</head>
<body bgcolor="#E6E6E6">
<h1>Bienvenido.<br></h1>
 
<h2>Por favor, ingrese su nombre de usuario y contrase�a.<br></h2>

<form action="MenuPpal.jsp" method="post">
		<table>
			<tr>
				<td>Usuario</td>
				<td><input name="usuario" /></td>
			</tr>
			<tr>
				<td>Contrase�a</td>
				<td><input name="contrasenia" type="password"  /></td>
			</tr>
		</table>
		<input type="submit"/>
	</form>

</body>
</html>