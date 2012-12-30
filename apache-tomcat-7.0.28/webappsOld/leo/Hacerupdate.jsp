<%@page import="Base.metodosSql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#E6E6E6">
<%String usuario=session.getAttribute("usuario").toString();%>
<%=session.getAttribute("usuario").toString() %>

<%
session.setAttribute("usuario", usuario);
metodosSql metodos=new metodosSql();
String cliente=request.getParameter("cliente");

int dia;

 
//String mes=request.getParameter("mes");
String tipohora=request.getParameter("tipohora");	
String tarea=request.getParameter("tarea");
String subtarea=request.getParameter("subtarea");
double horas=Double.parseDouble(request.getParameter("horas"));


String fecha=request.getParameter("Fecha");
int dni=Integer.parseInt(metodos.consultarUnaColumna("select dni from userlogin where usuario = '"+ session.getAttribute("usuario").toString()+"'").get(0));

String departamento=request.getParameter("departamento");
String descripcion=request.getParameter("comentarios");

int status=metodos.insertarOmodif("insert INTO registroGral "+
"(`tarea`, `subtarea`, `descripcion`, `departamento`, `dniPersonal`, `cliente`, `horastrabajadas`,`tipoHora` ,`fecha`)"+
"VALUES ('"+tarea+"', '"+subtarea+"', '"+descripcion+"', '"+departamento+"', "+dni+", '"+cliente+"', "+horas+", '"+tipohora+"', '"+fecha+"')");

if(status==1){
	
	
	session.setAttribute("status", "Ok");
	response.sendRedirect("CargaDiaria.jsp");
	//out.println("Los datos se han guardado correctamente");
	
}else{ 
	out.println("Hay un problema!!!, los datos pudieron no haberse guardado, si el problema persiste contacte al administrador");
	
}


%>

</body>
</html>