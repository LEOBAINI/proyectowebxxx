<%@page import="Base.metodosSql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.*" %>
 <%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>




<title>CARGA DIARIA DE DATOS</title>

</head>

<body >
<%
HttpSession sesion=request.getSession();
if(sesion.equals(null)){
	response.sendRedirect("index.jsp");
}



out.println("<body bgcolor=\"#F2EFFB\">"); %>


	<form action="Hacerupdate.jsp" method="post">

<%
String usuario=session.getAttribute("usuario").toString(); 
String permiso=session.getAttribute("permiso").toString();
String fechaCarga=session.getAttribute("fechaCarga").toString();//toma la fecha del menu, la de hoy por defecto.



		
		
		out.println("Bienvenido "+usuario+"<br>");
			//Comienza la creacion del select Especialidad
		
		
		metodosSql metodos=new metodosSql();
			String horasDeHoy="0";
			if (metodos.consultarUnaColumna("SELECT sum(horastrabajadas) FROM proyectoweb.registrogral "+
					" where fecha='"+fechaCarga+"' and "+ 
					" dnipersonal=(select dni from proyectoweb.userlogin "+
					" where usuario='"+usuario+"') ;").get(0)==null){
				horasDeHoy="0";
				
			}else{
				horasDeHoy=metodos.consultarUnaColumna("SELECT sum(horastrabajadas) FROM proyectoweb.registrogral "+
						" where fecha='"+fechaCarga+"' and "+ 
						" dnipersonal=(select dni from proyectoweb.userlogin "+
						" where usuario='"+usuario+"') ;").get(0);
			}
			
		out.println("En el dia "+fechaCarga+" usted tiene "+horasDeHoy+" horas trabajadas<br><br>");
		
		

			//----------------------------------fin del select nombre----------------------------------------------------------------------------------------  

			//---------------------------------comienza  select cliente---------------------------------------------------------------------------------
			
			
			out.println("Aqu� puede modificar la fecha si lo desea, o bien use la fecha de hoy por defecto <br>");
			out.println("<input type= text name=" + " Fecha " +" value= "+fechaCarga+"> mantenga el formato AAAA-MM-DD<br>");
			
			
			
			out.println("Cliente.....");
			ArrayList<String> array2 = new ArrayList<String>();
			
			array2=metodos.consultarUnaColumna("SELECT descripcion from cliente");
			array2.add(0,"");
			

			out.println(" <select name=" + " cliente " + " >");

			for (int i = 0; i < array2.size(); i++)

				out.println(" <option value=" + array2.get(i) + ">"
						+ array2.get(i) + "</option>");

			out.println("</select>");
			out.println("<br>");
			

			//---------------------------------comienza  select tipo de hora---------------------------------------------------------------------------------
			out.println("Tipo de hora");
			ArrayList<String> array5 = new ArrayList<String>();
			
			array5=metodos.consultarUnaColumna("SELECT descripcion from tipoHora ");
			array5.add(0,"");

			out.println(" <select name=" + " tipohora " + ">");

			for (int i = 0; i < array5.size(); i++)

				out.println(" <option value=" + array5.get(i) + ">"
						+ array5.get(i) + "</option>");

			out.println("</select>");
			out.println("<br>");

			//---------------------------------comienza  select tipo de Departamento---------------------------------------------------------------------------------
			out.println("Depto.......");
			ArrayList<String> array6 = new ArrayList<String>();
			
			array6=metodos.consultarUnaColumna("SELECT descripcion from departamento ");
			array6.add(0,"");
			
			out.println(" <select name=" + " departamento " + ">");

			for (int i = 0; i < array6.size(); i++)

				out.println(" <option value=" + array6.get(i) + ">"
						+ array6.get(i) + "</option>");

			out.println("</select>");
			out.println("<br>");

			//---------------------------------comienza  select tipo de Tarea---------------------------------------------------------------------------------
			out.println("Tarea.......");
			ArrayList<String> array7 = new ArrayList<String>();
			
			array7=metodos.consultarUnaColumna("SELECT descripcion from tarea ");
			array7.add(0,"");
			

			out.println(" <select name=" + " tarea " + ">");

			for (int i = 0; i < array7.size(); i++)

				out.println(" <option value=" + array7.get(i) + ">"
						+ array7.get(i) + "</option>");

			out.println("</select>");
			out.println("<br>");
			
			//---------------------------------comienza  select tipo de SubTarea---------------------------------------------------------------------------------
			out.println("Subtarea....");
			ArrayList<String> array8 = new ArrayList<String>();
			
			array8=metodos.consultarUnaColumna("SELECT descripcion from subtarea ");
			array8.add(0,"");
			

			out.println(" <select name=" + " subtarea " + ">");

			for (int i = 0; i < array8.size(); i++)

				out.println(" <option value=" + array8.get(i) + ">"
						+ array8.get(i) + "</option>");

			out.println("</select>");
			out.println("<br>");
			out.println("<br>");
			
			//------------------------------------------------------------------------
			out.println("<br>Hs utilizadas");

			out.println(" <select name=" + " horas " + ">");

			for (double i = 0; i < 23;i = i + 0.5 )
			
			out.println(" <option value=" + i + ">"	+ i + "</option>");

			out.println("</select>");
			out.println("<br><br><br><br><br><br>");
			
			//--------------------dato adicional--------------------------------------
			
			out.println("<br>Dato adicional:<br>"+
					"<textarea name=comentarios rows=2 cols=50></textarea>"+ 
					"<br>");
			
			
			
		%>
		
		


	
			

	
		<input type="submit" value="Aceptar"/><br><br>
		<a href="MenuPpal.jsp" >Volver a menu</a>
		

	</form>
	

</body>

</html>
