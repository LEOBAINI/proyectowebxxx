<%@page import="Base.metodosSql"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLDecoder"%>
<%@page session="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#E6E6E6">
<%
try{
if(session.equals(null)){
		response.sendRedirect("index.jsp");
	}




String usuario=session.getAttribute("usuario").toString();
// linea al pedo session.getAttribute("usuario").toString();


session.setAttribute("fechaCarga", request.getParameter("Fecha"));
session.setAttribute("usuario", usuario);
metodosSql metodos=new metodosSql();
//String clienteSindeco=request.getParameter("cliente");
String cliente=URLDecoder.decode(request.getParameter("cliente"), "UTF-8");//request.getParameter("cliente");

int dia;

 
//String mes=request.getParameter("mes");
int idRegistroGral=0;
if(session.getAttribute("nroRegistro")!=null){
	idRegistroGral=Integer.parseInt(session.getAttribute("nroRegistro").toString());
}

String tipohora=request.getParameter("tipohora");	
String tarea=URLDecoder.decode(request.getParameter("tarea"), "UTF-8");//request.getParameter("tarea");
String subtarea=URLDecoder.decode(request.getParameter("subtarea"), "UTF-8");//request.getParameter("subtarea");
double horas=Double.parseDouble(request.getParameter("horas"));


String fecha=request.getParameter("Fecha");
StringTokenizer fechaCompleta=new StringTokenizer(fecha);

int anio=Integer.parseInt(fechaCompleta.nextToken("-"));
int mes=Integer.parseInt(fechaCompleta.nextToken("-"));


int dni=Integer.parseInt(metodos.consultarUnaColumna("select dni from userlogin where usuario = '"+ session.getAttribute("usuario").toString()+"'").get(0));
//String cliente=URLDecoder.decode(request.getParameter("clientes"), "UTF-8");
String departamento=URLDecoder.decode(request.getParameter("departamento"),"UTF-8");
String descripcion=request.getParameter("comentarios");
ArrayList<String>periodo=metodos.consultarUnaColumna("select "+metodos.dameNroTeDoyMes(mes)+" from mesesestado	where usuario ='"+usuario+"' and anio = "+anio);																														
String periodoEstaAboCerr=null;
if(periodo.size()>0){
	periodoEstaAboCerr=periodo.get(0).toString();
	
}else{
	out.println("No tiene periodo creado en la tabla mesesestado solicitele a su administrador que lo abra");/*creale un periodo */
}




/*  ACA VALIDACION SI MES ESTA CERRADO, NO SE PUEDE AGREGAR...............

preguntar en cu�l tabla? 
		C�mo?
				
				select FEBRERO from proyectoweb.mesesestado
				where usuario ='leo' and anio =2012;


SI ESTO D� ABIERTO PUEDE INSERTAR SINO MENSAJITO...



*/
int status=0;

if(!periodoEstaAboCerr.equals("CERRADO")){//si el periodo esta abierto
	
	
	if(session.getAttribute("esEdicion")!=null){//si es para editar entre aqu�
		if(session.getAttribute("esEdicion").equals("SI")){
			//solo puede actualizar sus propios registros...
			
		status=metodos.insertarOmodif("UPDATE `proyectoweb`.`registrogral` SET `tarea`='"+tarea+"', `subtarea`='"+subtarea+"', `descripcion`='"+descripcion+"', `departamento`='"+departamento+"',"+
				"`cliente`='"+cliente+"', `horastrabajadas`="+horas+", `tipohora`='"+tipohora+"', `fecha`='"+fecha+"' WHERE `idregistroGral`='"+idRegistroGral+"' and dniPersonal= '"+dni+"';");


			session.setAttribute("esEdicion", "NO");
			if(status==1){
				%><script type="text/javascript">alert("Datos cargados con �xito!");
				 document.location=("CargaDiaria.jsp");//redireccion 
				
				</script><%
				
			}else{
				%><script type="text/javascript">alert("Hubo un problema, no se cargaron los datos");
				 document.location=("CargaDiaria.jsp");//redireccion 
				
				</script><%
				
			}
			
			
		}
	}
	else{// si es un registro nuevo entre aqu�
	 status=metodos.insertarOmodif("insert INTO registroGral "+
			"(`tarea`, `subtarea`, `descripcion`, `departamento`, `dniPersonal`, `cliente`, `horastrabajadas`,`tipoHora` ,`fecha`)"+
			"VALUES ('"+tarea+"', '"+subtarea+"', '"+descripcion+"', '"+departamento+"', "+dni+", '"+cliente+"', "+horas+", '"+tipohora+"', '"+fecha+"')");
	 metodos.abrirMes(usuario, mes, anio);
	}
	
}
else{
	
	out.println("Usted esta intentando a�adir un registro para un periodo que ya ha sido cerrado por usted mismo, solicitele a un administrador que lo reabra...<br><br><br>");
	
}




if(status==1){
	
	
	session.setAttribute("status", "Ok");
	
	%><script type="text/javascript">alert("Datos cargados con �xito!");
	 document.location=("CargaDiaria.jsp");//redireccion 
	
	</script><%
	
}else{ 
	out.println("Hay un problema!!!, los datos pudieron no haberse guardado, si el problema persiste contacte al administrador<br><br><br><br>");

	
	
	
}
}catch(Exception e){
	out.println(e.getMessage());
	
}


%>

<a href="MenuPpal.jsp">Volver a men�</a><br><br>
<a href="Tabla.jsp">Volver a tabla</a><br><br>
<a href="CargaDiaria.jsp">Volver a cargar datos</a>

</body>
</html>