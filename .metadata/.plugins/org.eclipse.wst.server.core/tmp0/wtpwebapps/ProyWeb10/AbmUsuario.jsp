<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Base.*" %>
    <%@page import="java.util.*" %>
    <%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function rellenar(){
	
	var indice = document.modificacion.clientes.selectedIndex;


	var valor = document.modificacion.clientes[indice].value; 
	valor=valor.replace(/[^a-zA-Z 0-9.]+/g,' ');
	
	document.modificacion.nuevoValor.value=valor.toString();
	
}</script>
<script type="text/javascript">
function comprobarContrasenia(){
	var contra1=document.alta.contrasenia.value;
	var contra2=document.alta.confirmecontrasenia.value;
	if(contra1==contra2 && contra1.lenght > 0 && contra2.lenght > 0){
		alert("Contraseñas confirmadas");
		
		
		
	}else if(contra1 != contra2){
		alert("Las contraseñas no coinciden, ingreselas de nuevo");
		document.alta.contrasenia.value="";
		document.alta.confirmecontrasenia.value="";
		document.alta.contrasenia.focus();
		return false;
		
	}else if(contra1 == "" || contra2 == ""){
		alert("La contraseña no debe quedar vacía, por favor, complétela.");
		if(contra1 == "")document.alta.contrasenia.focus();
		if(contra2 == "")document.alta.confirmecontrasenia.focus();
		
		return false;
	}

}</script>


<script type="text/javascript">
<!--
//Validar que el campo de formulario contenga sólo números
function validacionNumerica(campo_a_validar)  {
if (isNaN(campo_a_validar.value)) {
alert("Error:\nEl campo Dni/Legajo, debe tener sólo números.");
campo_a_validar.focus();
return false;

 }
}

</script>

<script type="text/javascript">

function comprobarCampos(){
	
	if(document.alta.nombre.value == ""){
		alert("Complete el Nombre.");
		document.alta.nombre.focus();
		return false;		
	}
	if(document.alta.apellido.value == ""){
		alert("Complete el Apellido.");
		document.alta.apellido.focus();
		return false;	
		
	}
	if(document.alta.usuario.value == ""){
		alert("Complete el Usuario.");
		document.alta.usuario.focus();
		return false;	
		
	}
	if(document.alta.direccion.value == ""){
		alert("Complete la Direccion.");
		document.alta.direccion.focus();
		return false;
		
	}
	if(document.alta.telefono.value == ""){
		alert("Complete el Teléfono.");
		document.alta.telefono.focus();
		return false;
		
	}
	if(document.alta.dni.value == ""){
		alert("Complete el Dni.");
		document.alta.dni.focus();
		return false;
		
	}
	if(document.alta.legajo.value == ""){
		alert("Complete el Legajo.");
		document.alta.legajo.focus();
		return false;
		
	}
	if(document.alta.contrasenia.value == ""){
		alert("Complete la Contraseña.");
		document.alta.contrasenia.focus();
		return false;
		
	}
	if(document.alta.confirmecontrasenia.value == ""){
		alert("Por favor, confirme contraseña.");
		document.alta.confirmecontrasenia.focus();
		return false;
		
	}
	if(document.alta.dni.value == ""){
		alert("Por favor, complete Dni.");
		document.alta.dni.focus();
		return false;
		
	}
	if(document.alta.legajo.value == ""){
		alert("Por favor, complete legajo.");
		document.alta.legajo.focus();
		return false;
		
	}
	if(comprobarContrasenia()== false){
		return false;
	}
	
	
	
	
	
}




</script>
<script type="text/javascript">

function usuarioDuplicado(usuario){
	
	
}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Abm de Usuarios</title>
<link rel="stylesheet" type="text/css" href="style/style.css" />
</head>
<body bgcolor="#E6E6E6">
<a>Bienvenido al Alta,Baja,Modificación de Usuarios.</a><br>



<%
session.setAttribute("solicitaAbm", "AbmUsuario");//ÉSTE SETEO ESTARÁ EN TODOS LOS JSP DE ABM PARA INDICAR AL ABMCOMMITER LA ACCION CORRESPONDIENTE


String accion=request.getParameter("accion");//ÉSTE ACCION VIENE CARGADO DE MENUABM CON (Alta,Baja o Modificación)
session.setAttribute("accion", accion);//ACA ACCION PASA A SER UN ATRIBUTO DE SESION PARA SER LLEVADO AL ABMCOMMITER

out.println("Que hago? :"+ accion);



//request.getParameter("abm"); es el que hay que usar para saber accion a tomar


metodosSql metodos=new metodosSql();
ArrayList<String>categoriaPersonal;
categoriaPersonal=metodos.consultarUnaColumna("Select descripcion from proyectoweb.categoriaPersonal ");

if(accion.equals("Alta"))
{ out.println("Eligió dar de alta un nuevo usuario, complete los campos. ");
%>

<form  name="alta" action="AbmCommitter.jsp" method="post" onsubmit= " return comprobarCampos()" >
<input type="hidden" name="contraseniaOK" value="false">
		<table border="3" >
		 <thead>
		 </thead>
         <tbody> 
			<tr>
				<td>Nombre</td>
				<td><input name="nombre"  /></td>
			</tr>
			<tr>
				<td>Apellido</td>
				<td><input name="apellido"  /></td>
			</tr>
			<tr>
				<td>Usuario</td>
				<td><input name="usuario"  /></td>
			</tr>
			<tr>
				<td>Contraseña</td>
				<td><input type="password" name="contrasenia"  /></td>
			</tr>
			<tr>
				<td>Confirme Contraseña</td>
				<td><input type="password" name="confirmecontrasenia"  /></td>
			</tr>
			<tr>
				<td>Permiso</td>
				<td><select name="permiso">
			<option value="administrador">Administrador</option>			
			<option value="usuario">Usuario</option>
			

		</select></td>
			</tr>
			<tr>
				<td>Dni</td>
				<td><input name="dni"  onblur="validacionNumerica(dni)"/></td>
			</tr>
			<tr>
				<td>Legajo</td>
				<td><input name="legajo" onblur="validacionNumerica(legajo)" /></td>
			</tr>
			<tr>
				<td>Dirección</td>
				<td><input name="direccion"  /></td>
			</tr>
			<tr>
				<td>teléfono</td>
				<td><input name="telefono"  /></td>
			</tr>
			<tr>
				<td>Categoría</td>
				<td>
				<select name="categoria"  >
	        <%
			for (int i = 0; i < categoriaPersonal.size(); i++)

				out.println(" <option value=" + java.net.URLEncoder.encode(categoriaPersonal.get(i), "UTF-8") + ">"
						+ categoriaPersonal.get(i) + "</option>");
			%>
			</select></td>
			</tr>
			<tr>
				<td>Confirme</td>
				<td><input type="submit" value="Crear Usuario" /></td>
			</tr>
			
			
			
         </tbody> 
		</table>

		
	</form>
	<br><br><br>
	
<% 
}
else if(accion.equals("Baja"))
{

	%><form name="baja" action="AbmCommitter.jsp" method="post"><%
	out.println("Eligio dar de baja un usuario, seleccione de la lista desplegable.<br><br>");


 

metodosSql metodos2=new metodosSql();
ArrayList<String>usuarios=metodos2.consultarUnaColumna("SELECT usuario FROM proyectoweb.userlogin where Inhabilitado='NO' order by usuario");
out.println("Usuarios");

out.println(" <select name=" + " usuarios " + ">");

for (int i = 0; i < usuarios.size(); i++)
	//encodeURIComponent(unencoded) para javascript
	//java.net.URLEncoder.encode(usuarios.get(i), "UTF-8")
	out.println(" <option value=" + java.net.URLEncoder.encode(usuarios.get(i), "UTF-8") + ">"
			+ usuarios.get(i) + "</option>");

out.println("</select>");
out.println("<br>");


%><input type="submit" value="Borrar!"></input>

</form><%
}
else if(accion.equals("Modificacion"))
{

	%><form name="modificacion" action="AbmCommitter.jsp" method="post"><%
	out.println("Eligio modificar un cliente, seleccione de la lista desplegable.<br><br>");

metodosSql metodos3=new metodosSql();
ArrayList<String>clientes=metodos3.consultarUnaColumna("select descripcion from cliente where Inhabilitado='NO' order by descripcion");
out.println("Clientes");

out.println(" <select name=" + " clientes " + "onChange='rellenar()'>");

for (int i = 0; i < clientes.size(); i++)
	//encodeURIComponent(unencoded) para javascript
	//java.net.URLEncoder.encode(usuarios.get(i), "UTF-8")
	out.println(" <option value=" + java.net.URLEncoder.encode(clientes.get(i), "UTF-8") + ">"
			+ clientes.get(i) + "</option>");

out.println("</select>");
out.println("<br>");




%>
<a>Ingrese aquí el nuevo nombre del cliente</a>
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