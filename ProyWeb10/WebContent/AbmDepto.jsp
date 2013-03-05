<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="Base.metodosSql,java.util.*"%>
    <%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function rellenar(){
	
	var indice = document.modificacion.departamentos.selectedIndex;


	var valor = document.modificacion.departamentos[indice].value; 
	valor=valor.replace(/[^a-zA-Z 0-9.]+/g,' ');
	
	document.modificacion.nuevoValor.value=valor.toString();
	
}</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Abm de departamentos</title>
<link rel="stylesheet" type="text/css" href="style/style.css" />
</head>
<body bgcolor="#E6E6E6">
<a>Bienvenido al Alta,Baja,Modificación de Departamentos.</a><br>



<%
session.setAttribute("solicitaAbm", "AbmDepto");//ÉSTE SETEO ESTARÁ EN TODOS LOS JSP DE ABM PARA INDICAR AL ABMCOMMITER LA ACCION CORRESPONDIENTE


String accion=request.getParameter("accion");//ÉSTE ACCION VIENE CARGADO DE MENUABM CON (Alta,Baja o Modificación)
session.setAttribute("accion", accion);//ACA ACCION PASA A SER UN ATRIBUTO DE SESION PARA SER LLEVADO AL ABMCOMMITER

out.println("Que hago? :"+ accion);



//request.getParameter("abm"); es el que hay que usar para saber accion a tomar


metodosSql metodos=new metodosSql();
int nrodepartamentosugerido=Integer.parseInt(metodos.consultarUnaColumna("SELECT max(idDepartamento) FROM proyectoweb.departamento;").get(0));
nrodepartamentosugerido++;
if(accion.equals("Alta"))
{ out.println("Eligió dar de alta un nuevo departamento, complete los campos. ");
%>

<form name="alta" action="AbmCommitter.jsp" method="post">
		<table border="3" align="left">
			<tr>
				<td>Nombre del departamento</td>
				<td><input name="departamento" value="" /></td>
			</tr>
			<tr>
				<td>departamento Nro°</td>
				<td><input name="numerodepartamento" value="<%=nrodepartamentosugerido%>" /></td>
			</tr>
			
		</table>

		<br><br><br><br><input type="submit" value="Crear departamento"/>
	</form>
	<br><br><br>
	<a>Se sugiere que no modifique el numero de departamento, a menos que lo necesite, pero si lo hace, coloque un número mayor al sugerido. </a>
<% 
}
else if(accion.equals("Baja"))
{

	%><form name="baja" action="AbmCommitter.jsp" method="post"><%
	out.println("Eligio dar de baja un departamento, seleccione de la lista desplegable.<br><br>");


 

metodosSql metodos2=new metodosSql();
ArrayList<String>_deptos=metodos2.consultarUnaColumna("select descripcion from departamento where Inhabilitado='NO' order by descripcion");
out.println("departamentos");

out.println(" <select name=" + " departamentos " + ">");

for (int i = 0; i < _deptos.size(); i++)
	//encodeURIComponent(unencoded) para javascript
	//java.net.URLEncoder.encode(usuarios.get(i), "UTF-8")
	out.println(" <option value=" + java.net.URLEncoder.encode(_deptos.get(i), "UTF-8") + ">"
			+ _deptos.get(i) + "</option>");

out.println("</select>");
out.println("<br>");


%><input type="submit" value="Borrar!"></input>

</form><%
}
else if(accion.equals("Modificacion"))
{

	%><form name="modificacion" action="AbmCommitter.jsp" method="post"><%
	out.println("Eligio modificar un departamento, seleccione de la lista desplegable.<br><br>");

metodosSql metodos3=new metodosSql();
ArrayList<String>_deptos=metodos3.consultarUnaColumna("select descripcion from departamento where Inhabilitado='NO' order by descripcion");
out.println("departamentos");

out.println(" <select name=" + " departamentos " + "onChange='rellenar()'>");

for (int i = 0; i < _deptos.size(); i++)
	//encodeURIComponent(unencoded) para javascript
	//java.net.URLEncoder.encode(usuarios.get(i), "UTF-8")
	out.println(" <option value=" + java.net.URLEncoder.encode(_deptos.get(i), "UTF-8") + ">"
			+ _deptos.get(i) + "</option>");

out.println("</select>");
out.println("<br>");




%>
<a>Ingrese aquí el nuevo nombre del departamento</a>
<br><input name="nuevoValor" value="" size="40">
<br>
<input type="submit" value="Modificar"></input>

</form><%
}
%>

<br>
<a href="MenuABM.jsp" >Volver a ABM</a><br>
<a href="MenuPpal.jsp" >Volver a menu principal</a>
</body>
</html>