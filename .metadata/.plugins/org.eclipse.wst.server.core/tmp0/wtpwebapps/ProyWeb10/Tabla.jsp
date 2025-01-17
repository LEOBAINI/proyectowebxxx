<%@page import="Base.metodosSql"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
function Envia(destino){
	tabla.action=destino;
	tabla.submit();
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tabla maestra</title>
</head>
<body bgcolor="#E6E6E6"><br>
<%
if(session.getAttribute("usuario")==null){
		response.sendRedirect("index.jsp");
	}
%>


 <a href="MenuPpal.jsp">Volver al Men�</a><br>

<%String filtrar=session.getAttribute("filtrar").toString(); %>


<table  border="4" bgcolor="#D8D8D8"> 
<thead >
<tr>
<th>NRO REGISTRO</th>
<th>TAREA</th>
<th>SUBTAREA</th>
<th>DESCRIPCION</th>
<th>DEPARTAMENTO</th>
<th>USUARIO</th>
<th>CLIENTE</th>
<th>HS</th>
<th>TIPO HS</th>
<th>FECHA</th>
<th>ESTADO</th>
</tr>
</thead>
<tbody>
<%


String hsTotal;
metodosSql metodos=new metodosSql();
if(filtrar.equals("no")){
//pide atributos de session de menuPpal


ArrayList<ArrayList<String>> matriz=new ArrayList<ArrayList<String>>();

String usuario=session.getAttribute("usuario").toString();

String dniUser=metodos.consultarUnaColumna("select dni from userlogin where usuario ='"+usuario+"'").get(0);

ArrayList<ArrayList<String>> matrizPers=new ArrayList<ArrayList<String>>();

matrizPers=metodos.consultar("SELECT apellido,nombre,especialidad FROM proyectoweb.personal where dni ="+dniUser);

String nivelAcceso=session.getAttribute("permiso").toString();

String tipoUsuario;

if(nivelAcceso.equals("usuario")){//si es usuario
	tipoUsuario="Usuario";
	String datosPersonales=matrizPers.get(0).get(0)+" "+matrizPers.get(0).get(1)+" "+matrizPers.get(0).get(2);
	out.println("Consulta para el usuario  : "+dniUser+" "+datosPersonales);
}else{
	tipoUsuario="Administrador";
}


out.println("<br> Usted es "+tipoUsuario+" del sistema");

///sin filtro

if(tipoUsuario.equals("Usuario")){
	/**
	*Si es usuario solo podr� ver la tabla con sus propios datos
	*
	*
	*/
	
	
	
String consultaUsuario="SELECT idregistrogral,tarea,subtarea,descripcion,departamento,dnipersonal,cliente,horastrabajadas,tipohora,fecha,estado"+
		" FROM proyectoweb.REGISTROGRAL"+
		" where dniPersonal= (select dni from proyectoweb.userlogin where usuario='"+usuario+"')";

session.setAttribute("consultaUsuario", consultaUsuario);


matriz=metodos.consultar(consultaUsuario);

		
}else{
	
	String consultaAdministrador="SELECT idregistrogral,tarea,subtarea,descripcion,departamento,"+
			"usuario,cliente,horastrabajadas,tipohora,fecha,estado "+
			" FROM proyectoweb.registrogral r,proyectoweb.userlogin u "+
			"where u.dni= r.dnipersonal order by usuario;";
			
session.setAttribute("consultaAdministrador", consultaAdministrador);
			
	matriz=metodos.consultar(consultaAdministrador);
	
	
	
}

for(int i=0;i<matriz.size();i++){
	out.println("<tr>");
	for(int j=0;j<11;j++){//10 son la cantidad de elementos del ancho
		out.println("<td>"+matriz.get(i).get(j)+"</td>");
		
	}
	out.println("<tr>");
}


if(tipoUsuario.equals("Usuario")){
	hsTotal=metodos.consultarUnaColumna("SELECT SUM(horastrabajadas) FROM REGISTROGRAL where dniPersonal="+dniUser).get(0);
}else{
	hsTotal=metodos.consultarUnaColumna("SELECT SUM(horastrabajadas) FROM REGISTROGRAL r,userlogin u where u.dni= r.dnipersonal").get(0);
}


//descargar sin filtro
session.setAttribute("matrizNoFiltrada", matriz);
out.println("<a href='Descarga.jsp'>Descargar en formato Excel</a>");

}


//////////////////////////////CON FILTRO//////////////////////////////////////////////////////



else{// Si la opcion en el request, viene con filtrado.
	//--------------------------------------------------------------------------------------------------------------------------------------------------------
	//session.setAttribute("filtrar", "no");
	String desde=request.getParameter("Desde");
	String hasta=request.getParameter("Hasta");
	String filtro=request.getParameter("Filtro");
	String criterio=request.getParameter("Criterio");
	String paramFiltro;
	
	 hsTotal="sin horas";
	out.println("Usted consult� desde "+desde+" hasta  "+hasta+" "+" filtr� por "+filtro+" usando el critrio de filtro "+criterio+ ". <br><br>");
	
	ArrayList<ArrayList<String>> matriz2=new ArrayList<ArrayList<String>>();
	ArrayList<ArrayList<String>> matrizPers2=new ArrayList<ArrayList<String>>();
	
	String dniUser=metodos.consultarUnaColumna("select dni from userlogin where usuario ='"+ session.getAttribute("usuario").toString()+"'").get(0);

	
	matrizPers2=metodos.consultar("SELECT apellido,nombre,especialidad FROM proyectoweb.personal where dni ="+dniUser);

	String nivelAcceso=session.getAttribute("permiso").toString();
	
	String tipoUsuario;
	
	if(nivelAcceso.equals("usuario")){//si no es administrador
		tipoUsuario="Usuario";
		String datosPersonales=matrizPers2.get(0).get(0)+" "+matrizPers2.get(0).get(1)+" "+matrizPers2.get(0).get(2);
		out.println("Consulta para el usuario  : "+dniUser+" "+datosPersonales);
	}else{
		tipoUsuario="Administrador";
	}


	out.println("<br> Usted es "+tipoUsuario+" del sistema");
	
	//llenando la matriz con los filtros//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	if(tipoUsuario.equals("Usuario")){//solo mostrara los registros donde aparezca su dni
	try{
	String consultaUsuarioFiltro="Select idregistrogral,tarea,subtarea,descripcion,departamento,usuario,cliente,horastrabajadas,tipohora,fecha,estado"+
			" from proyectoweb.registrogral r,proyectoweb.personal p,proyectoweb.userlogin u "+
			" where "+filtro+"='"+criterio+"' and "+
			" fecha >='"+desde+"' and "+
			" fecha <='"+hasta+"'and "+
			" r.dnipersonal= p.dni and "+
			"p.dni= "+dniUser+" and "+
			"u.dni= "+dniUser;
	session.setAttribute("consultaUsuarioFiltro", consultaUsuarioFiltro);
	matriz2=metodos.consultar(consultaUsuarioFiltro);
	
	}catch(Exception e){
		response.sendRedirect("index.jsp");
	}
	
	}else{//si es administrador vera todos los registros no importa el usuario
		String consultaAdministradorFiltro="Select idregistrogral,tarea,subtarea,descripcion,departamento,usuario,cliente,horastrabajadas,tipohora,fecha,estado"+
	" from proyectoweb.registrogral r,proyectoweb.personal p,proyectoweb.userlogin u "+
				" where "+filtro+"='"+criterio+"' and "+
				" fecha >='"+desde+"' and "+
				" fecha <='"+hasta+"'and "+
				" r.dnipersonal=p.dni and "+
				"u.dni=p.dni";
		session.setAttribute("consultaAdministradorFiltro",consultaAdministradorFiltro);
		matriz2=metodos.consultar(consultaAdministradorFiltro);//duda con esta....
	}
	
	
	
//MOSTRANDO POR PANTALLA///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	for(int i=0;i<matriz2.size();i++){
		out.println("<tr>");
		for(int j=0;j<11;j++){//8 son la cantidad de elementos del ancho
			
			out.println("<td>"+matriz2.get(i).get(j)+"</td>");
			
			
		}
		out.println("<tr>");
	}
//FIN MOSTRANDO POR PANTALLA/////////////////////////////////////////////////////////////////////////////////////////////////////////////





//horas sumadas para la consulta de arriba si es usuario

	if(tipoUsuario.equals("Usuario")){
		try{
		hsTotal=metodos.consultarUnaColumna("SELECT SUM(horastrabajadas)"+
				" from proyectoweb.registrogral r,proyectoweb.personal p "+
				" where "+filtro+"='"+criterio+"' and "+
				" fecha >='"+desde+"' and "+
				" fecha <='"+hasta+"'and "+
				" r.dnipersonal= p.dni and "+
				"p.dni= "+dniUser).get(0);
		}catch(Exception e){
			response.sendRedirect("loginError.jsp");
			
		}
	}
	
	
	
	
	
	else{
		hsTotal=metodos.consultarUnaColumna("SELECT SUM(horastrabajadas)"+
	" from proyectoweb.registrogral r,proyectoweb.personal p,proyectoweb.userlogin u "+
				"  where "+filtro+"='"+criterio+"' and "+
						" fecha >='"+desde+"' and "+
						" fecha <='"+hasta+"'and "+
						" r.dnipersonal=p.dni and "+
						"u.dni=p.dni").get(0);
	}



	session.setAttribute("matrizFiltrada", matriz2);

	out.println("<a href='Descarga.jsp'>Descargar en formato Excel</a>");
}


%>

		

</tbody>
</table>
<form action="EdicionRegistroGral.jsp" name="tabla">
<a>Ingrese aqui nro de registro para editar contenido</a><br>
		
		<input type="text" id="nroRegistro" name=nroRegistro ><br>
		<input type="button"  value="Editar"  OnClick="Envia('EdicionRegistroGral.jsp')">
	</form>

El total de horas para esta consulta es de <%=hsTotal %><br>

<a href="MenuPpal.jsp">Volver a men�</a><br><br>




</body>
</html>