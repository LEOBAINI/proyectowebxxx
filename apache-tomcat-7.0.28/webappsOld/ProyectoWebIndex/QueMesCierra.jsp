<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Elegir mes</title>
</head>
<body bgcolor="#E6E6E6">
	<%
	String usuario=null;
	if(session.getAttribute("usuario")!=null){
	usuario=session.getAttribute("usuario").toString();
	out.println("Usuario: "+usuario);
	
	}else{
		out.println("No hay sesion iniciada<br>");
		%><a href="index.jsp">Iniciar sesion </a><%
	}
	
	
	
	
	%>
	<form action="CerrarMes.jsp" method="post">
	
	
	<%
	String estado=request.getParameter("estado");
	
	
	
	if(estado!=null){
		
	if(estado.equals("1")){
		%>
			<script>
			alert('Los datos se cargaron correctamente.')
		  </script>
		  <%
	}else{
		%>
		<script>
		alert('Hubo un problema al cargar los datos.')
	  </script>
	  <%
		
	}
	
	
	}%>
	<a>Elija el mes que va a cerrar</a>
	<br>
	<br>
	
		<select name="meses">
			<option value="1">ENERO</option>
			<option value="2">FEBRERO</option>
			<option value="3">MARZO</option>
			<option value="4">ABRIL</option>
			<option value="5">MAYO</option>
			<option value="6">JUNIO</option>
			<option value="7">JULIO</option>
			<option value="8">AGOSTO</option>
			<option value="9">SEPTIEMBRE</option>
			<option value="10">OCTUBRE</option>
			<option value="11">NOVIEMBRE</option>
			<option value="12">DICIEMBRE</option>

		</select>
		
		
	<input type="submit" value="Aceptar" />
	</form>


	
	<br>
	<br>
	<a href="MenuPpal.jsp">Volver a menu</a>
</body>
</html>