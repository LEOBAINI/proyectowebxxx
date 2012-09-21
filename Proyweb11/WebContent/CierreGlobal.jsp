<%@page import="Base.metodosSql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head> 
<body bgcolor="#E6E6E6">
<table border="3">
<thead>
<tr>
<th>USUARIO</th>
<th>ENERO</th>
<th>FEBRERO</th>
<th>MARZO</th>
<th>ABRIL</th>
<th>MAYO</th>
<th>JUNIO</th>
<th>JULIO</th>
<th>AGOSTO</th>
<th>SEPTIEMBRE</th>
<th>OCTUBRE</th>
<th>NOVIEMBRE</th>
<th>DICIEMBRE</th>
<th>AÑO</th>
</tr>
</thead>
<tbody>

<%
String permisoDeUser = session.getAttribute("permiso").toString();
String user=session.getAttribute("usuario").toString();

ArrayList<ArrayList<String>> matriz2=new ArrayList<ArrayList<String>>();
if(permisoDeUser.equalsIgnoreCase("administrador")){
metodosSql metodos=new metodosSql();
	matriz2=metodos.consultar("select USUARIO,ENERO,FEBRERO,MARZO, ABRIL, MAYO,JUNIO,JULIO,AGOSTO,SEPTIEMBRE,OCTUBRE,NOVIEMBRE,DICIEMBRE,ANIO  from MesesEstado  "+
			"where anio = "+metodos.dameAnio());
}else{
	metodosSql metodos=new metodosSql();
	matriz2=metodos.consultar("select USUARIO,ENERO,FEBRERO,MARZO, ABRIL, MAYO,JUNIO,JULIO,AGOSTO,SEPTIEMBRE,OCTUBRE,NOVIEMBRE,DICIEMBRE,ANIO  from MesesEstado  "+
			"where anio = "+metodos.dameAnio()+" and usuario = '"+user+"'");
	
}
	
	
	
	
//MOSTRANDO POR PANTALLA///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	for(int i=0;i<matriz2.size();i++){
		out.println("<tr>");
		for(int j=0;j<14;j++){//13 son la cantidad de elementos del ancho
			if(matriz2.get(i).get(j)==null){
				out.println("<td> - </td>");
			}else{
			out.println("<td>"+matriz2.get(i).get(j)+"</td>");
			}
			
		}
		out.println("<tr>");
	}
%>
</tbody>
</table>
<BR>
<a href="MenuPpal.jsp">Volver al Menú</a><br>
</body>
</html>