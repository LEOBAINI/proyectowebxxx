<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="Base.metodosSql"%>
    <%@page import="java.util.ArrayList"%>
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
<th>COMPANIA</th>
<th>SERIAL</th>
<th>NRO DE TELEFONO</th>




</tr>
</thead>
<tbody>
<%
metodosSql metodos=new metodosSql();


ArrayList<ArrayList<String>>matriz=new ArrayList<ArrayList<String>>();


matriz=metodos.consultar("select marca,serial,nrotelefono from chip");
for(int i=0;i<matriz.size();i++){
	out.println("<tr>");
	for(int j=0;j<3;j++){//8 son la cantidad de elementos del ancho
		out.println("<td>"+matriz.get(i).get(j)+"</td>");
		
	}
	out.println("<tr>");
}


%>
</tbody>
</table>
</html>