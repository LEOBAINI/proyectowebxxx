<%@page import="Base.metodosSql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>




<title>CARGA DIARIA DE DATOS</title>

</head>

<body >
<%out.println("<body bgcolor=\"#F2EFFB\">"); %>


	<form action="Hacerupdate.jsp" method="post">

<%String usuario=session.getAttribute("usuario").toString(); %>
<%String permiso=session.getAttribute("esAdministrador").toString();%>



		<%
		
		out.println("Bienvenido "+usuario+"<br>");
			//Comienza la creacion del select Especialidad
		%>
		
		<%
		
		metodosSql metodos=new metodosSql();
		out.println("El dia de HOY usted tiene "+ metodos.consultarUnaColumna("SELECT sum(horastrabajadas) FROM proyectoweb.registrogral "+
				" where fecha='"+metodos.dameFechaDeHoy()+"' and "+ 
				" dnipersonal=(select dni from proyectoweb.userlogin "+
				" where usuario='"+usuario+"') ;").get(0)+" horas trabajadas<br>");
		
		/*if(request.getParameter("user").equals("leo")){
			
			
		}else{
			
			response.sendRedirect("invaliduser.html");
			
		}*/
		/*out.println("Especialidad");
		
			
			ArrayList<String> array =new ArrayList<String>();
			
			array=metodos.consultarUnaColumna("SELECT especialidad FROM personal");
			array.add(0,"");
			
			out.println(" <select name=" + " especialidad " + ">");

			for (int i = 0; i < array.size(); i++)

				out.println(" <option value=" + array.get(i) + ">"
						+ array.get(i) + "</option>");

			out.println("</select>");
			out.println("<br>");*/

			//---------------------------------fin del select especialidad---------------------------------------------------------------------------------
			//---------------------------------comienza  select nombre---------------------------------------------------------------------------------
			
			/*ArrayList<String> array1 = new ArrayList<String>();
			("SELECT Apellido,Nombre FROM personal order by Apellido");
			

			out.println(" <select name=" + " nombre " + ">");

			for (int i = 0; i < array1.size(); i++)

				out.println(" <option value=" + array1.get(i) + ">"
						+ array1.get(i) + "</option>");

			out.println("</select>");*/

			//----------------------------------fin del select nombre----------------------------------------------------------------------------------------  

			//---------------------------------comienza  select cliente---------------------------------------------------------------------------------
			out.println("Aquí puede modificar la fecha si lo desea, o bien use la fecha de hoy por defecto <br>");
			out.println("<input type= text name=" + " Fecha " +" value= "+metodos.dameFechaDeHoy()+"> mantenga el formato AAAA-MM-DD<br>");
			
			
			
			out.println("Cliente.....");
			ArrayList<String> array2 = new ArrayList<String>();
			
			array2=metodos.consultarUnaColumna("SELECT descripcion from cliente");
			array2.add(0,"");
			

			out.println(" <select name=" + " cliente " + ">");

			for (int i = 0; i < array2.size(); i++)

				out.println(" <option value=" + array2.get(i) + ">"
						+ array2.get(i) + "</option>");

			out.println("</select>");
			out.println("<br>");
			//----------------------------------fin del select cliente----------------------------------------------------------------------------------------  

			//---------------------------------comienza  select dia---------------------------------------------------------------------------------
		/*	out.println("Dia");
			ArrayList<String> array3 = new ArrayList<String>();
			
			array3=metodos.consultarUnaColumna("SELECT dia from dia");
			array3.add(0,"");
			

			out.println(" <select name=" + " dia " + ">");

			for (int i = 0; i < array3.size(); i++)

				out.println(" <option value=" + array3.get(i) + ">"
						+ array3.get(i) + "</option>");

			out.println("</select>");
			
			out.println("<br>");*/

			//----------------------------------fin del select dia----------------------------------------------------------------------------------------  

			//---------------------------------comienza  select mes---------------------------------------------------------------------------------
			/*out.println("Mes");
			ArrayList<String> array4 = new ArrayList<String>();
			
			array4=metodos.consultarUnaColumna("SELECT nombre from mes ");
			array4.add(0,"");
			
			out.println(" <select name=" + " mes " + ">");

			for (int i = 0; i < array4.size(); i++)

				out.println(" <option value=" + array4.get(i) + ">"
						+ array4.get(i) + "</option>");

			out.println("</select>");
			out.println("<br>");*/

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
		
			


		<input type="submit" value="Aceptar" />

	</form>
	

</body>

</html>
