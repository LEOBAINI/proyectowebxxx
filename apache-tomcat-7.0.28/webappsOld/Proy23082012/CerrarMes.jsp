<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.Choice"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Base.metodosSql"%>
<%@page import="java.util.StringTokenizer"%>
<%@page session="true"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cerrar mes</title>
</head>
<body bgcolor="#E6E6E6">

	<%
	
	
		String usuario = null;
		if (session.getAttribute("usuario") != null) {
			usuario = session.getAttribute("usuario").toString();
			out.println("Usuario: " + usuario);

		} else {
			out.println("No hay sesion iniciada");
			response.sendRedirect("index.jsp");
		}
	%>




	<%
		String mesString;

		mesString=request.getParameter("meses");
		
		out.println("El mes elegido para cerrar es el nro : " + mesString);
		//session.getAttribute("usuario");
		int estado = 0;
		int estado2=0;
		metodosSql metodos = new metodosSql();
		String dni=null;
		if(usuario!=null){
		 dni = metodos.consultarUnaColumna("select dni from userlogin where usuario= '"+usuario+"' ").get(0);
		 
		}

		if (mesString.length() < 2) {//formatear para sql
			mesString = "0" + mesString;
		}

		
		if(dni!=null){
		estado = metodos.cerrarMes(usuario,Integer.parseInt(mesString));
		
		/*("UPDATE `proyectoweb`.`registrogral`"
						+ " SET `estado`='CERRADO' WHERE dnipersonal= "
						+ dni
						+ " and "
						+ metodos.damePeriodo(Integer.parseInt(mesString),
								Integer.parseInt(metodos.dameAnio()),
								"fecha"));*/
		
		
		}

		
		
		
	%>
	<form name="test" action="QueMesCierra.jsp">
		<input type="hidden" value=<%=estado%> name="estado">


		<!--es un auto submit -->

		<SCRIPT>
			LANGUAGE = "JavaScript" > setTimeout('document.test.submit()', 10);
		</SCRIPT>
	</form>
	


</body>
</html>