<%@page import="Base.metodosSql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.*" %>
  <%@page import="java.net.URLEncoder" %>
 
 <%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>



<title>EDICION DE DATOS</title>

</head>

<body >

<%










HttpSession sesion=request.getSession();
if(sesion.equals(null)){
	response.sendRedirect("index.jsp");
}



out.println("<body bgcolor=\"#F2EFFB\">"); %>


	<form name="EdicionRegistroGral" action="Hacerupdate.jsp" method="post">

<%
String usuario=session.getAttribute("usuario").toString(); 
String permiso=session.getAttribute("permiso").toString();
String fechaCarga=session.getAttribute("fechaCarga").toString();//toma la fecha del menu, la de hoy por defecto.




		
		
		out.println("Bienvenido "+usuario+"<br>");
			//Comienza la creacion del select Especialidad
		
		/*
		urldecoder y encoder importar java.util.* (net)
		
		
		
		del lado del server
        String cliente=URLDecoder.decode(request.getParameter("clientes"), "UTF-8");
		
			
		del lado del cliente ejemplo un select.
		out.println(" <option value=" + java.net.URLEncoder.encode(usuarios.get(i), "UTF-8") + ">"
				+ usuarios.get(i) + "</option>");
		
		
		*/
		int nroRegistro=-1;
		metodosSql metodos=new metodosSql();
		if(request.getParameter("nroRegistro")!=null){	
		nroRegistro=Integer.parseInt(request.getParameter("nroRegistro").toString());	
		session.setAttribute("nroRegistro", nroRegistro);
		}
		if(nroRegistro!=-1){
		out.println("�sta es la informaci�n del registro n�mero "+nroRegistro+" edite los campos correspondientes<br>");
		ArrayList<ArrayList <String>>fila=metodos.consultar("select * from registrogral where idregistrogral= "+nroRegistro);
		String tarea=fila.get(0).get(1);
		String subtarea=fila.get(0).get(2);
		String descripcion=fila.get(0).get(3);
		String departamento=fila.get(0).get(4);
		String user=fila.get(0).get(5);
		String cliente=fila.get(0).get(6);
		String horas=fila.get(0).get(7);
		String tipoHs=fila.get(0).get(8);
		String fecha=fila.get(0).get(9);
		String estado=fila.get(0).get(10);
		
		session.setAttribute("esEdicion", "SI");
			
			
			//---------------------------------comienza  select cliente---------------------------------------------------------------------------------
			
			
			
			out.println("<input type= text name=" + " Fecha " +" value= "+fecha+"> mantenga el formato AAAA-MM-DD<br>");
			
			
			
			out.println("Cliente.....**"+cliente+"**<br> EDITAR");
			ArrayList<String> array2 = new ArrayList<String>();
			
			array2=metodos.consultarUnaColumna("SELECT descripcion from cliente where Inhabilitado='NO'");
			array2.add(0,"");
			
			
			out.println(" <select name=" + " cliente " + " >");

			for (int i = 0; i < array2.size(); i++){
				
				if(array2.get(i).equals(cliente)){
					out.println(" <option value=" + java.net.URLEncoder.encode(array2.get(i), "UTF-8") + " selected>"
							+array2.get(i)  + "</option>");
				}else{
					
				
				out.println(" <option value=" + java.net.URLEncoder.encode(array2.get(i), "UTF-8") + ">"
						+array2.get(i) + "</option>");
				}
			}

			out.println("</select>");
			
			out.println("<br>");
			
			

			//---------------------------------comienza  select tipo de hora---------------------------------------------------------------------------------
			out.println("Tipo de hora **"+tipoHs+"**<br> EDITAR");
			ArrayList<String> array5 = new ArrayList<String>();
			
			array5=metodos.consultarUnaColumna("SELECT descripcion from tipoHora ");
			array5.add(0,"");

			out.println(" <select name=" + " tipohora " + ">");

			for (int i = 0; i < array5.size(); i++){
				
				if(array5.get(i).equals(tipoHs)){
					out.println(" <option value=" + java.net.URLEncoder.encode(array5.get(i), "UTF-8") + " selected>"
							+ array5.get(i) + "</option>");

				}
				else{

				out.println(" <option value=" + java.net.URLEncoder.encode(array5.get(i), "UTF-8") + ">"
						+ array5.get(i) + "</option>");
				}
			}

			out.println("</select>");
			out.println("<br>");

			//---------------------------------comienza  select tipo de Departamento---------------------------------------------------------------------------------
			out.println("Depto.......**"+departamento+"**<br> EDITAR");
			ArrayList<String> array6 = new ArrayList<String>();
			
			array6=metodos.consultarUnaColumna("SELECT descripcion from departamento ");
			array6.add(0,"");
			
			out.println(" <select name=" + " departamento " + ">");

			for (int i = 0; i < array6.size(); i++){
				if(array6.get(i).equals(departamento)){
					out.println(" <option value=" + java.net.URLEncoder.encode(array6.get(i), "UTF-8") + " selected>"
							+ array6.get(i) + "</option>");
					
				}else{

				out.println(" <option value=" + java.net.URLEncoder.encode(array6.get(i), "UTF-8") + ">"
						+ array6.get(i) + "</option>");
				}
			}

			out.println("</select>");
			out.println("<br>");

			//---------------------------------comienza  select tipo de Tarea---------------------------------------------------------------------------------
			out.println("Tarea.......**"+tarea+"**<br> EDITAR");
			ArrayList<String> array7 = new ArrayList<String>();
			
			array7=metodos.consultarUnaColumna("SELECT descripcion from tarea ");
			array7.add(0,"");
			

			out.println(" <select name=" + " tarea " + ">");

			for (int i = 0; i < array7.size(); i++){
				
				if(array7.get(i).equals(tarea)){
					out.println(" <option value=" + java.net.URLEncoder.encode(array7.get(i), "UTF-8") + " selected>"
							+ array7.get(i) + "</option>");
					
				}else{

				out.println(" <option value=" + java.net.URLEncoder.encode(array7.get(i), "UTF-8") + ">"
						+ array7.get(i) + "</option>");
				}
			}
			out.println("</select>");
			out.println("<br>");
			
			//---------------------------------comienza  select tipo de SubTarea---------------------------------------------------------------------------------
			out.println("Subtarea....**"+subtarea+"**<br> EDITAR");
			ArrayList<String> array8 = new ArrayList<String>();
			
			array8=metodos.consultarUnaColumna("SELECT descripcion from subtarea ");
			array8.add(0,"");
			

			out.println(" <select name=" + " subtarea " + ">");

			for (int i = 0; i < array8.size(); i++){
				if(array8.get(i).equals(subtarea)){
					out.println(" <option value=" + java.net.URLEncoder.encode(array8.get(i), "UTF-8") + " selected>"
							+ array8.get(i) + "</option>");
					
				}else{
					out.println(" <option value=" + array8.get(i) + ">"
							+ array8.get(i) + "</option>");
					
				}

				
			}

			out.println("</select>");
			out.println("<br>");
			out.println("<br>");
			
			//------------------------------------------------------------------------
			out.println("<br>Hs utilizadas **"+horas+"**<br> EDITAR");

			out.println(" <select name=" + " horas " + ">");

			for (double i = 0; i < 23;i = i + 0.5 ){
			
			out.println(" <option value=" + i + ">"	+ i + "</option>");
			}
			out.println(" <option value=" + horas + " selected>"	+ horas + "</option>");

			out.println("</select>");
			out.println("<br><br><br><br><br><br>");
			
			//--------------------dato adicional--------------------------------------
			
			out.println("<br>Dato adicional: <br>"+
			
					"<textarea name=comentarios rows=2 cols=50 >"+descripcion+"</textarea>"+ 
					"<br>");
			
		
		
		
			
		%>
		
		


	
			

		<%if(estado.equals("ABIERTO")){
		%><input type="submit" value="Aceptar"/><br><br><%
		}
		else{
			out.println("Usted no puede cambiar los datos porque el periodo est� cerrado");
		}
		}
		else{
			response.sendRedirect("Tabla.jsp");
		}
		%>
		<a href="Tabla.jsp" >Volver a tabla</a>
		<a href="MenuPpal.jsp" >Volver a menu</a>
		

	</form>
	

</body>

</html>
