<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Base.metodosSql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FILTRO DE CONTENIDO</title>
</head>
<body bgcolor="#E6E6E6">

	<input type="hidden" value="si" name="filtrar">

	<form action="EspFiltro.jsp" method="post">
		<H1>Aquí puede filtrar el contenido de la tabla de datos</H1>
		<%=session.getAttribute("usuario")%>
		<br>
		<%
	
		session.setAttribute("filtrar", "si");
			metodosSql metodos = new metodosSql();
			out.println("Desde");
			ArrayList<String> array = new ArrayList<String>();

			array = metodos	.consultarUnaColumna("SELECT fecha from registrogral where fecha is not null order by fecha asc ");

			out.println("<input type= text name=" + " Desde " +" value= "+metodos.consultarUnaColumna("select min(fecha)from registrogral").get(0)+"><br>");
			
			/*out.println(" <select name=" + " Desde " + ">");

			for (int i = 0; i < array.size(); i++)

				out.println(" <option value=" + array.get(i) + ">"
						+ array.get(i) + "</option>");

			out.println("</select>");*/
			out.println("Hasta ");
			out.println("<input type= text name=" + " Hasta " +" value= "+metodos.consultarUnaColumna("select max(fecha)from registrogral").get(0)+">");
			
			/*out.println("Hasta");
			ArrayList<String> array1 = new ArrayList<String>();

			array1 = metodos
					.consultarUnaColumna("SELECT fecha from registrogral where fecha is not null order by fecha desc ");

			out.println(" <select name=" + " Hasta " + ">");

			for (int i = 0; i < array1.size(); i++)

				out.println(" <option value=" + array1.get(i) + ">"
						+ array1.get(i) + "</option>");

			out.println("</select>");*/
			
			  
			
			
			
			out.println("<br>");
			out.println("<br>");
			//out.println(request.getParameter("Desde"));

			out.println("Filtrado por");
			ArrayList<String> array2 = new ArrayList<String>();

			array2 = metodos.consultarUnaColumna("SELECT COLUMN_NAME"
					+ " FROM information_schema.COLUMNS"
					+ " WHERE TABLE_SCHEMA  LIKE 'PROYECTOWEB'"
					+ " AND TABLE_NAME = 'REGISTROGRAL' ");

			out.println(" <select name=" + " Filtro " + ">");

			for (int i = 0; i < array2.size(); i++)

				out.println(" <option value=" + array2.get(i) + ">"
						+ array2.get(i) + "</option>");

			out.println("</select>");
			out.println("<br>");
			out.println("<br>");
			
		%>
		<input type="submit" value="Aceptar" />
	</form>
	
	<script type="text/javascript">
			  function getSelectValue(selectName) {
			    var _form = document.forms["formaQueContieneElSelect"];
			    var _select = _form.elements[selectName];
			    return _select[_select.selectedIndex].value};
			    </script>
			   
</body>
</html>