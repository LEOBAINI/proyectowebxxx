<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="Base.metodosSql,java.util.*"%>
    <%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function rellenar(){
	
	var indice = document.modificacion.subTareas.selectedIndex;


	var valor = document.modificacion.subTareas[indice].value; 
	valor=valor.replace(/[^a-zA-Z 0-9.]+/g,' ');
	
	document.modificacion.nuevoValor.value=valor.toString();
	
}</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Abm de Sub-Tareas</title>
<link rel="stylesheet" type="text/css" href="style/style.css" />
</head>
<body bgcolor="#E6E6E6">
<a>Bienvenido al Alta,Baja,Modificaci�n de Sub-Tareas.</a><br>



<%
session.setAttribute("solicitaAbm", "AbmSubTarea");//�STE SETEO ESTAR� EN TODOS LOS JSP DE ABM PARA INDICAR AL ABMCOMMITER LA ACCION CORRESPONDIENTE


String accion=request.getParameter("accion");//�STE ACCION VIENE CARGADO DE MENUABM CON (Alta,Baja o Modificaci�n)
session.setAttribute("accion", accion);//ACA ACCION PASA A SER UN ATRIBUTO DE SESION PARA SER LLEVADO AL ABMCOMMITER

out.println("Que hago? :"+ accion);



//request.getParameter("abm"); es el que hay que usar para saber accion a tomar


metodosSql metodos=new metodosSql();
int nroSubTareaSugerido=Integer.parseInt(metodos.consultarUnaColumna("SELECT max(idSubTarea) FROM proyectoweb.subtarea;").get(0));
nroSubTareaSugerido++;
if(accion.equals("Alta"))
{ out.println("Eligi� dar de alta una nueva Subtarea, complete los campos. ");
%>

<form name="alta" action="AbmCommitter.jsp" method="post">
		<table border="3" align="left">
			<tr>
				<td>Nombre de la Subtarea</td>
				<td><input name="subTarea" value="" /></td>
			</tr>
			
			<tr>

				<%
					metodosSql metodos2 = new metodosSql();
						ArrayList<String> tareas = metodos2
								.consultarUnaColumna("select descripcion from tarea where Inhabilitado='NO' order by descripcion");
						out.println("<td>Tarea asociada</td>");

						out.println("<td> <select name=" + " tareas " + ">");

						for (int i = 0; i < tareas.size(); i++)
							//encodeURIComponent(unencoded) para javascript
							//java.net.URLEncoder.encode(usuarios.get(i), "UTF-8")
							out.println(" <option value="
									+ java.net.URLEncoder.encode(tareas.get(i),
											"UTF-8") + ">" + tareas.get(i)
									+ "</option>");

						out.println("</select> </td>");
				%>

			</tr>
			<tr>
				<td>SubTarea Nro�</td>
				<td><input name="numeroSubTarea" value="<%=nroSubTareaSugerido%>" readonly/></td>
			</tr>
			
		</table>

		<br><br><br><br><input type="submit" value="Crear SubTarea"/>
	</form>
	<br><br><br>
	
<% 
}
else if(accion.equals("Baja"))
{

	%><form name="baja" action="AbmCommitter.jsp" method="post"><%
	out.println("Eligio dar de baja una Subtarea, seleccione de la lista desplegable.<br><br>");


 

metodosSql metodos2=new metodosSql();
ArrayList<String>subTareas=metodos2.consultarUnaColumna("select descripcion from subtarea where Inhabilitado='NO' order by descripcion");
out.println("SubTareas");

out.println(" <select name=" + " subtareas " + ">");

for (int i = 0; i < subTareas.size(); i++)
	//encodeURIComponent(unencoded) para javascript
	//java.net.URLEncoder.encode(usuarios.get(i), "UTF-8")
	out.println(" <option value=" + java.net.URLEncoder.encode(subTareas.get(i), "UTF-8") + ">"
			+ subTareas.get(i) + "</option>");

out.println("</select>");
out.println("<br>");


%><input type="submit" value="Borrar!"></input>

</form><%
}
else if(accion.equals("Modificacion"))
{

	%><form name="modificacion" action="AbmCommitter.jsp" method="post"><%
	out.println("Eligio modificar una Subtarea, seleccione de la lista desplegable.<br><br>");

metodosSql metodos3=new metodosSql();
ArrayList<String>subTareas=metodos3.consultarUnaColumna("select descripcion from subtarea where Inhabilitado='NO' order by descripcion");
out.println("SubTareas");

out.println(" <select name=" + " subTareas " + "onClick='rellenar()' onChange='rellenar()'>");

for (int i = 0; i < subTareas.size(); i++)
	//encodeURIComponent(unencoded) para javascript
	//java.net.URLEncoder.encode(usuarios.get(i), "UTF-8")
	out.println(" <option value=" + java.net.URLEncoder.encode(subTareas.get(i), "UTF-8") + ">"
			+ subTareas.get(i) + "</option>");


out.println("</select>");
out.println("<br>");




%>
<a>Ingrese aqu� el nuevo nombre de la Subtarea</a>
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