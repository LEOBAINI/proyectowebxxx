

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page session="true" %>
  

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inicio</title>

<link rel="stylesheet" type="text/css" href="style/style.css" /><!-- Para cambiar tema desde un solo archivo -->

</head>
<body title="Ingrese usuario y contraseña" bgcolor="#E6E6E6" >
<!-- <body bgcolor="#E6E6E6">-->

<h1 align="center"><u>Bienvenido.</u></h1><br>
 
<h2 align="center" ><u>Por favor, ingrese su nombre de usuario y contraseña.</u>                            v30<br></h2>

 <form action="Validacion.jsp" method="post">

		<table border="3" align="left">
			<tr>
				<td>Usuario</td>
				<td><input name="usuario" value="" /></td>
			</tr>
			<tr>
				<td>Contraseña</td>
				<td><input name="contrasenia" type="password" value="" /></td>
			</tr>
		</table>
		<br><input type="submit"/>
		
	</form>

</body>
</html>