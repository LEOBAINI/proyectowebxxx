<%@page import="Base.metodosSql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Abrir mes</title>
</head>
<body bgcolor="#E6E6E6">

	<%
		String usuario=null;
			if(session.getAttribute("usuario")!=null){
			usuario=session.getAttribute("usuario").toString();
			out.println("Usuario: "+usuario);
			
			}else{
		out.println("No hay sesion iniciada<br>");
		response.sendRedirect("index.jsp");
	%><a href="index.jsp">Iniciar sesion </a>
	<%
		}
	%>
	<form action="AbrirMes.jsp" method="post">


		<%
			
				String usuarioActualizado=request.getParameter("user");
				String mes=request.getParameter("month");
				String anio=request.getParameter("year");
			metodosSql metodos=new metodosSql();
			
			ArrayList<String> usuarios=new ArrayList<String>();
			usuarios=metodos.consultarUnaColumna("select usuario from userlogin");
			
			
			
	String estado=request.getParameter("status");
	
	System.out.println(estado);
	
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
	
	}
	
	%>
		<a>Elija el mes que va a abrir</a> <br> <br> <a>MES</a> <select
			name="meses">
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

		</select> <a>AÑO</a> <input type="text" name="anio"	value=<%=metodos.dameAnio()%>>

		<%
			out.println("USUARIOS");

			out.println(" <select name=" + " usuarios " + ">");

			for (int i = 0; i < usuarios.size(); i++)

				out.println(" <option value=" + usuarios.get(i) + ">"
						+ usuarios.get(i) + "</option>");

			out.println("</select>");
			out.println("<br>");
		%>


		<input type="submit" value="Aceptar" />
	</form>



	<br>
	<br>
	<a href="MenuPpal.jsp">Volver a menu</a>

</body>
</html>