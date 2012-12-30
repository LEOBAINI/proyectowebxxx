<%@page import="seguridad.Validacion"%>
<%@page import="Base.metodosSql"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MenuPpal</title>
</head>
<body bgcolor="#E6E6E6">


<input type="hidden" value="no" name="filtrar">
	<%
	//setHeader("Refresh", "5; URL=http://host/path")
	
	
	
	metodosSql metodos = new metodosSql();
	%>
	<%if(request.getParameter("usuario")!=null && request.getParameter("contrasenia")!=null){
		
		String usuario = request.getParameter("usuario");	
		String contrasenia = request.getParameter("contrasenia");
	
	
	    
	    session.setAttribute("usuario", usuario);
		session.setAttribute("contrasenia", contrasenia);
		}
	%>

	<%out.print("Mostrando usuario de sesion "+session.getAttribute("usuario"));//usuario%>
	<%//contrasenia%>
	<%
	boolean esAdministrador=false;
	
	session.setAttribute("filtrar", "no");
		Validacion val = new Validacion();
		String permisoDeUser = val.validarUsuario(session.getAttribute("usuario").toString(), session.getAttribute("contrasenia").toString());
		//session.setAttribute("usuario", usuario);
		
		if (permisoDeUser != null) {
			if (permisoDeUser.equals("administrador")){
			
				session.setAttribute("esAdministrador",true);
				
				

				//response.sendRedirect("IngresoConsulta.jsp");
			
			}
			if(permisoDeUser.equals("usuario")) {
				
				session.setAttribute("esAdministrador",false);
				
				//response.sendRedirect("IngresoConsulta.jsp");	
		
		
			}
		}
		else {
			response.sendRedirect("loginError.jsp");//si no tiene permisos suficientes, error!
		}
		//out.println(permisoDeUser);
		//response.setHeader("Refresh", "1");
	%>


<a href="CargaDiaria.jsp">Cargar Datos</a><br><br>
<a href="Tabla.jsp">Ver Datos sin filtro (solo de su perfil si es usuario)</a><br><br>
<a href="FiltroConsulta.jsp">Ver Datos con filtro (solo de su perfil si es usuario)</a>
</body>
</html>