<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Base.metodosSql"%>
    <%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Abm de Clientes</title>
<link rel="stylesheet" type="text/css" href="style/style.css" />
</head>
<body bgcolor="#E6E6E6">
<a>Bienvenido al Alta,Baja,Modificaci�n de Clientes.</a><br>



<%
session.setAttribute("solicitaAbm", "AbmCliente");
session.setAttribute("accion", "Alta");




//request.getParameter("abm");


metodosSql metodos=new metodosSql();
int nroClienteSugerido=Integer.parseInt(metodos.consultarUnaColumna("SELECT max(idCliente) FROM proyectoweb.cliente;").get(0));
nroClienteSugerido++;
if(session.getAttribute("accion").equals("Alta")){ out.println("Eligi� dar de alta un nuevo cliente, complete los campos sin dejar espacios. ");
%>

<form name="alta" action="AbmCommitter.jsp" method="post">
		<table border="3" align="left">
			<tr>
				<td>Raz�n Social</td>
				<td><input name="razonSocial" value="" /></td>
			</tr>
			<tr>
				<td>Cliente Nro�</td>
				<td><input name="numeroCliente" value="<%=nroClienteSugerido%>" /></td>
			</tr>
			
		</table>

		<br><br><br><br><input type="submit" value="Crear Cliente"/>
	</form>
	<br><br><br>
	<a>Se sugiere que no modifique el numero de cliente, a menos que lo necesite, pero si lo hace, coloque un n�mero mayor al sugerido. </a>







<% 
}


else if(session.getAttribute("accion").equals("Baja")){out.println("Eligio dar de baja un usuario, seleccione de la lista desplegable.");}
else if(session.getAttribute("accion").equals("Modificacion")){out.println("Eligio modificar un usuario, seleccione de la lista desplegable.");}






%>
<br>
<a href="MenuABM.jsp" >Volver a ABM</a><br>
<a href="MenuPpal.jsp" >Volver a menu principal</a>
</body>
</html>