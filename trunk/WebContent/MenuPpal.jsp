<%@page import="seguridad.Validacion"%>
<%@page import="Base.metodosSql"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MenuPpal</title>
</head>
<body bgcolor="#E6E6E6">


<input type="hidden" value="no" name="filtrar">

	<% 
	session.setAttribute("filtrar","no");
	
	
	metodosSql metodos = new metodosSql();
	session.setAttribute("fechaCarga", metodos.dameFechaDeHoy());
	
	
	
		String permisoDeUser = session.getAttribute("permiso").toString();
		//session.setAttribute("usuario", usuario);
		
		if (permisoDeUser != null) {
			if (permisoDeUser.equals("administrador")){
				out.println("Con permisos de administrador<br>");
			
				%> <a href= "QueMesAbre.jsp">Abrir periodo (Mes)</a><br><br>
				 <a href="QueMesCierra.jsp">Cerrar periodo (Mes)</a><br><br>	
				 <a href="CargaDiaria.jsp">Cargar Datos</a><br><br>
				 <a href="Tabla.jsp">Ver Datos sin filtro (solo de su perfil si es usuario)</a><br><br>
				 <a href="FiltroConsulta.jsp">Ver Datos con filtro (solo de su perfil si es usuario)</a><br><br>				
				 <a href="CierreGlobal.jsp">Ver cierres globales anual</a><br><br>
				 <a href="CerrarSesion.jsp">Cerrar sesión</a><br><br>
				  <%
				}
			if(permisoDeUser.equals("usuario")) {
				out.println("Con permisos de usuario<br>");
	  %>
		 <a href="CargaDiaria.jsp">Cargar Datos</a><br><br>
		 <a href="Tabla.jsp">Ver Datos sin filtro (solo de su perfil si es usuario)</a><br><br>
		 <a href="FiltroConsulta.jsp">Ver Datos con filtro (solo de su perfil si es usuario)</a><br><br>
		 <a href="QueMesCierra.jsp">Cerrar mes</a><br><br>
		 <a href="CierreGlobal.jsp">Ver mi cierre anual</a><br><br>
		 <a href="CerrarSesion.jsp">Cerrar sesión</a><br><br>
		 <%
				
		
		
			}
			
		}else{
			//out.println(permisoDeUser+ "  desde menuppal");
			response.sendRedirect("loginError.jsp");
		}
		%>
	
</body>
</html>