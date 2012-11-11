<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Base.metodosSql"%> 
   <%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function error(){
	alert("hola");
}

</script>
<%
out.println("<body bgcolor=\"#F2EFFB\">");
try{
String usuario=session.getAttribute("usuario").toString(); 
String fecha=request.getParameter("fechaConsulta");
if(usuario!=null && fecha!=null){
metodosSql metodos=new metodosSql();

String horasTrabajadas=metodos.dameHorasTrabajadas(fecha, usuario);
if(horasTrabajadas==null){
	%> <h1> <%
	out.println("Error, cargue la fecha nuevamente");
	%>
	</h1><%
}else{


%> <h1> <%
out.println("Ud trabajó "+horasTrabajadas+" horas el día "+fecha);
}
%>
</h1>
<a href="CargaDiaria.jsp">Volver</a><%


}else{
	%><script>alert("No se pudo consultar, dejó campos vacíos.");</script> <%
	response.sendRedirect("CargaDiaria.jsp");
}

}catch(Exception e){
	
	%><script>alert("Ups!, hay un problema, intentálo de nuevo.");</script>
	<%
	response.sendRedirect("CargaDiaria.jsp");
}

%>

</body>
</html>