<%@page import="Base.metodosSql"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#E0E0F8">
<table border="1">
<thead>
<tr>
<th>SERIAL</th>
<th>CHIP</th>
<th>MODELO</th>
<th>ESTADO</th>
<th>SECTOR</th>
<th>COMENTARIO</th>
<th>LUGAR FISICO REAL</th>


</tr>
</thead>
<tbody>
<%
metodosSql metodos=new metodosSql();


ArrayList<ArrayList<String>>matriz=new ArrayList<ArrayList<String>>();


matriz=metodos.consultar("select serial,chip,modelo,estado,sector_asignado,comentario,lugar_fisico_real from handheld");
for(int i=0;i<matriz.size();i++){
	out.println("<tr>");
	for(int j=0;j<7;j++){//8 son la cantidad de elementos del ancho
		out.println("<td>"+matriz.get(i).get(j)+"</td>");
		
	}
	out.println("<tr>");
}


%>
</tbody>
</table>
</body>
</html>