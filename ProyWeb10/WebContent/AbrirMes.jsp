
<%@page import="Base.metodosSql"%>
<%@page session="true"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	
		int status = 0;
		String anio = null;
		String usuarios = null;
		String meses = null;
		anio = request.getParameter("anio");
		usuarios = request.getParameter("usuarios");
		meses = request.getParameter("meses");
		metodosSql metodos = new metodosSql();

		status = metodos.abrirMes(usuarios, Integer.parseInt(meses),
				Integer.parseInt(anio));
	%>
	<form name="test1" action="QueMesAbre.jsp">
		<input type="hidden" value=<%=status%> name="status"> <input
			type="hidden" value=<%=usuarios%> name="user"> <input
			type="hidden" value=<%=meses%> name="month"> <input
			type="hidden" value=<%=anio%> name="year">


		<!--es un auto submit -->

		<SCRIPT>
			LANGUAGE = "JavaScript" > setTimeout('document.test1.submit()', 10);
		</SCRIPT>
	</form>

</body>
</html>