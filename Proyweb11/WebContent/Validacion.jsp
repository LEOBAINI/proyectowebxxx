<%@page import="seguridad.Validacion"%>
<%@page import="Base.metodosSql"%>
<%@page session="true"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>validacion</title>
</head>
<body bgcolor="#E6E6E6">
 

	
	<%
	String a=null;
		metodosSql metodos = new metodosSql();

		if (!request.getParameter("usuario").equals("")	&& !request.getParameter("contrasenia").equals("")) {

			String usuario = request.getParameter("usuario");
			String contrasenia = request.getParameter("contrasenia");
			Validacion val = new Validacion();
			String permisoDeUser = val.validarUsuario(usuario,contrasenia);
			a=permisoDeUser;
			

			
			
			

			if (permisoDeUser != null) {
				
				if (permisoDeUser.equals("administrador")) {
					session.setAttribute("usuario", usuario);
					session.setAttribute("contrasenia", contrasenia);
					session.setAttribute("permiso","administrador");
					response.sendRedirect("MenuPpal.jsp");

				}
				if (permisoDeUser.equals("usuario")) {
					session.setAttribute("usuario", usuario);
					session.setAttribute("contrasenia", contrasenia);
					session.setAttribute("permiso","usuario");
					response.sendRedirect("MenuPpal.jsp");

				}
				
				
			}else {
				response.sendRedirect("loginError.jsp");//si no tiene permisos suficientes, error! 
				
			}
		} else {
			response.sendRedirect("loginError.jsp");//si no tiene permisos suficientes, error!
			
		}
	%>


</body>
</html>