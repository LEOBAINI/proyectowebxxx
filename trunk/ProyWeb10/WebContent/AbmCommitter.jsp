<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Abm.*" %>
<%@page session="true"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Committer</title>
</head>
<body bgcolor="#819FF7">
<%AdministradorABM admin=new AdministradorABM();
if(session.getAttribute("solicitaAbm").equals("AbmCliente")){
	out.println("vino de AbmCliente");
	
	if(session.getAttribute("accion").equals("Alta")){
		Cliente cli=new Cliente(Integer.parseInt(request.getParameter("numeroCliente")),request.getParameter("razonSocial").toString());
		if(admin.darDeAlta(cli, "proyectoweb", "cliente")==1){
			%><script type="text/javascript">alert("Datos cargados con �xito!");
			 document.location=("AbmCliente.jsp");
			
			</script><%
		}else{
			
			%><script type="text/javascript">alert("Hubo un problema, intente de nuevo por favor.");
			
			 document.location=("AbmCliente.jsp");
			</script><%
			
			
			
			
		}
		
		
	}
	if(session.getAttribute("accion").equals("Baja")){
		out.println("baja");
		
	}
	if(session.getAttribute("accion").equals("Modificacion")){
		out.println("modificacion");
		
	}
	
	
	
	
	
	
}





%>



</body>
</html>