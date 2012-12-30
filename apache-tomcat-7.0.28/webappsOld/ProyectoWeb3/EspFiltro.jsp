<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Base.metodosSql"%>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EspFiltro</title>
</head>
<body bgcolor="#E6E6E6">
<form action="Tabla.jsp" method="post">
<%String desde=request.getParameter("Desde");
String hasta=request.getParameter("Hasta");
String filtro=request.getParameter("Filtro");
String criterio="Criterio";
System.out.println(desde);

out.println( "Esta filtrando desde "+desde+"<br>");
out.println("hasta "+hasta);
out.println(" y debe seleccionar un item de "+filtro+"<br>");


metodosSql metodos = new metodosSql();
out.println("Desde");
ArrayList<String> array = new ArrayList<String>();
if(filtro.equals("dniPersonal")){
	filtro="usuario";
	array = metodos	.consultarUnaColumna("SELECT usuario from userlogin where usuario is not null");
	
}else{

array = metodos	.consultarUnaColumna("SELECT DISTINCT "+filtro+" from registrogral where "+filtro+" is not null");
}
out.println(" <select name=" + criterio + ">");

for (int i = 0; i < array.size(); i++)

	out.println(" <option value=" + array.get(i) + ">"+ array.get(i) + "</option>");

out.println("</select>");

//desde,hasta,filtro vienen de filtroconsulta
%>
<input type="hidden" value=<%=desde %> name="Desde">
<input type="hidden" value=<%=hasta %> name="Hasta">
<input type="hidden" value=<%=filtro%> name="Filtro">
<input type="hidden" value=<%=criterio%> name="Criterio">
<input type="submit" value="Aceptar" />
</form>

</body>
</html>