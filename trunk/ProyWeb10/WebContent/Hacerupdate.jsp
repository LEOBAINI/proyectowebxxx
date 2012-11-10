<%@page import="Base.metodosSql"%>
<%@page import="java.util.StringTokenizer"%>
<%@page session="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#E6E6E6">
<%
try{
if(session.equals(null)){
		response.sendRedirect("index.jsp");
	}



String usuario=session.getAttribute("usuario").toString();
session.getAttribute("usuario").toString();


session.setAttribute("fechaCarga", request.getParameter("Fecha"));
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
StringTokenizer fechaCompleta=new StringTokenizer(fecha);

int anio=Integer.parseInt(fechaCompleta.nextToken("-"));
int mes=Integer.parseInt(fechaCompleta.nextToken("-"));


int dni=Integer.parseInt(metodos.consultarUnaColumna("select dni from userlogin where usuario = '"+ session.getAttribute("usuario").toString()+"'").get(0));

String departamento=request.getParameter("departamento");
String descripcion=request.getParameter("comentarios");
																																						
String periodoEstaAboCerr=metodos.consultarUnaColumna("select "+metodos.dameNroTeDoyMes(mes)+" from mesesestado	where usuario ='"+usuario+"' and anio = "+anio).get(0);
/*  ACA VALIDACION SI MES ESTA CERRADO, NO SE PUEDE AGREGAR...............

preguntar en cuál tabla? 
		Cómo?
				
				select FEBRERO from proyectoweb.mesesestado
				where usuario ='leo' and anio =2012;


SI ESTO DÁ ABIERTO PUEDE INSERTAR SINO MENSAJITO...



*/
int status=0;

if(!periodoEstaAboCerr.equals("CERRADO")){
	 status=metodos.insertarOmodif("insert INTO registroGral "+
			"(`tarea`, `subtarea`, `descripcion`, `departamento`, `dniPersonal`, `cliente`, `horastrabajadas`,`tipoHora` ,`fecha`)"+
			"VALUES ('"+tarea+"', '"+subtarea+"', '"+descripcion+"', '"+departamento+"', "+dni+", '"+cliente+"', "+horas+", '"+tipohora+"', '"+fecha+"')");
	 metodos.abrirMes(usuario, mes, anio);
	
}
else{
	
	out.println("Usted esta intentando añadir un registro para un periodo que ya ha sido cerrado por usted mismo, solicitele a un administrador que lo reabra...<br><br><br>");
	
}




if(status==1){
	
	
	session.setAttribute("status", "Ok");
	response.sendRedirect("CargaDiaria.jsp");
	//out.println("Los datos se han guardado correctamente");
	
}else{ 
	out.println("Hay un problema!!!, los datos pudieron no haberse guardado, si el problema persiste contacte al administrador<br><br><br><br>");

	
	
	
}
}catch(Exception e){
	out.println(e.getMessage());
	
}

%>

<a href="MenuPpal.jsp">Volver a menú</a><br><br>
<a href="CargaDiaria.jsp">Volver a cargar datos</a>

</body>
</html>