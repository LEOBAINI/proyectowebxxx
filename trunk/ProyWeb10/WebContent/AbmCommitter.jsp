<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Abm.*" %>
<%@page import="Base.*" %>
<%@page session="true"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Committer</title>
</head>
<body bgcolor="#819FF7">
<%
ConexionMySql conexion=new ConexionMySql();

AdministradorABM admin=new AdministradorABM();

if(session.getAttribute("solicitaAbm").equals("AbmCliente")){//inicio si viene de abmcliente
	//out.println("vino de AbmCliente");
	
	if(session.getAttribute("accion").equals("Alta")){//inicio si es para alta cliente
		
		Cliente cli=new Cliente(Integer.parseInt(request.getParameter("numeroCliente")),request.getParameter("razonSocial").toString());
		if(admin.darDeAlta(cli, "proyectoweb", "cliente")==1){
			%><script type="text/javascript">alert("Datos cargados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
		}		
		
		else{
			
			%><script type="text/javascript">alert("Hubo un problema, intente de nuevo por favor.");
			
			 document.location=("MenuABM.jsp");
			</script><%		
			
		}
		
		
	}//fin si es para alta cliente
	
	
	
	
	
	//si viene de baja hacer..
	if(session.getAttribute("accion").equals("Baja")){//inicio si es para baja cliente
		int statusBajaCliente=0;
		AdministradorABM adminBaja=new AdministradorABM();
		metodosSql metodos=new metodosSql();
		out.println("baja");
		
		String cliente=URLDecoder.decode(request.getParameter("clientes"), "UTF-8");
		
		
		
		
		String sentencia="Select idCliente from cliente where descripcion='"+cliente+"' and inHabilitado='NO';";
		int idCliente=Integer.parseInt(metodos.consultarUnaColumna(sentencia).get(0));
		Cliente clienteDelete=new Cliente(idCliente,cliente);
		statusBajaCliente= adminBaja.InHabilitar(clienteDelete,conexion.getBase(),"cliente");
		if(statusBajaCliente==1){
			%><script type="text/javascript">alert("Datos borrados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}else{
			%><script type="text/javascript">alert("Los datos no se borraron, intente de nuevo...");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}
		
		
		
	}//fin si es para baja cliente	
	
	if(session.getAttribute("accion").equals("Modificacion")){//inicio si es para modificacion cliente
		out.println("modificacion");
	try{
		int statusModifCliente=0;
		AdministradorABM adminModif=new AdministradorABM();
		metodosSql metodos=new metodosSql();
		
		
		
		String cliente=URLDecoder.decode(request.getParameter("clientes"), "UTF-8");
		
		
		
		
		
		int idCliente=Integer.parseInt(metodos.consultarUnaColumna("SELECT max(idCliente) FROM proyectoweb.cliente;").get(0));
		idCliente++;
		int idClienteDel=Integer.parseInt(metodos.consultarUnaColumna("SELECT idCliente FROM proyectoweb.cliente where descripcion= '"+cliente+"' and inHabilitado='NO';").get(0));
		String nuevaDescripcionCliente=request.getParameter("nuevoValor");
		Cliente nuevoCli=new Cliente(idCliente,nuevaDescripcionCliente);
		Cliente clienteDelete=new Cliente(idClienteDel,cliente);
		
		statusModifCliente= adminModif.InHabilitar(clienteDelete,conexion.getBase(),"cliente");
		statusModifCliente=statusModifCliente+adminModif.darDeAlta(nuevoCli,conexion.getBase(), "cliente");
		
		if(statusModifCliente==2){
			%><script type="text/javascript">alert("Datos modificados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}else{
			%><script type="text/javascript">alert("Los datos no se modificaron, intente de nuevo...");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}
	}catch(Exception e){
		out.println("Error, compruebe los datos suministrados e intente de nuevo... :\n "+e.getMessage());
		
		%><a href="MenuABM.jsp" >Volver a ABM</a><%
		
	}
	
	
	
	
	
	
		
	}//fin si es para modificacion de cliente
	
	
	
	
	
	
}//fin si viene de abmcliente
else if(session.getAttribute("solicitaAbm").equals("AbmTarea")){//inicio si viene de AbmTarea
	//out.println("vino de AbmTarea");
	
	if(session.getAttribute("accion").equals("Alta")){//inicio si es para alta tarea
		
		Tarea tar=new Tarea(Integer.parseInt(request.getParameter("numeroTarea")),request.getParameter("tarea").toString().toUpperCase());
		//usando upper case por primera vez en el proyecto
		if(admin.darDeAlta(tar, "proyectoweb", "tarea")==1){
			%><script type="text/javascript">alert("Datos cargados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
		}		
		
		else{
			
			%><script type="text/javascript">alert("Hubo un problema, intente de nuevo por favor.");
			
			 document.location=("MenuABM.jsp");
			</script><%		
			
		}
		
		
	}//fin si es para alta cliente
	
	
	
	
	
	//si viene de baja hacer..
	if(session.getAttribute("accion").equals("Baja")){//inicio si es para baja cliente
		int statusBajaCliente=0;
		AdministradorABM adminBaja=new AdministradorABM();
		metodosSql metodos=new metodosSql();
		out.println("baja");
		
		String tarea=URLDecoder.decode(request.getParameter("tareas"), "UTF-8");
		
		
		
		
		String sentencia="Select idTarea from tarea where descripcion='"+tarea+"' and inHabilitado='NO';";
		int idTarea=Integer.parseInt(metodos.consultarUnaColumna(sentencia).get(0));
		Tarea tareaDelete=new Tarea(idTarea, tarea);
		
		statusBajaCliente= adminBaja.InHabilitar(tareaDelete,conexion.getBase(),"tarea");
		if(statusBajaCliente==1){
			%><script type="text/javascript">alert("Datos borrados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}else{
			%><script type="text/javascript">alert("Los datos no se borraron, intente de nuevo...");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}
		
		
		
	}//fin si es para baja tarea	
	
	if(session.getAttribute("accion").equals("Modificacion")){//inicio si es para modificacion tarea
		out.println("modificacion");
	try{
		int statusModifTarea=0;
		AdministradorABM adminModif=new AdministradorABM();
		metodosSql metodos=new metodosSql();
		
		
		
		String tarea=URLDecoder.decode(request.getParameter("tareas"), "UTF-8");
		
		
		
		
		
		int idTarea=Integer.parseInt(metodos.consultarUnaColumna("SELECT max(idTarea) FROM proyectoweb.tarea;").get(0));
		idTarea++;
		int idTareaDel=Integer.parseInt(metodos.consultarUnaColumna("SELECT idTarea FROM proyectoweb.tarea where descripcion= '"+tarea+"' and inHabilitado='NO';").get(0));
		String nuevaDescripcionTarea=request.getParameter("nuevoValor");
		Tarea nuevaTarea=new Tarea(idTarea,nuevaDescripcionTarea);
		Tarea tareaDelete=new Tarea(idTareaDel,tarea);
		
		statusModifTarea= adminModif.InHabilitar(tareaDelete,conexion.getBase(),"tarea");
		statusModifTarea=statusModifTarea+adminModif.darDeAlta(nuevaTarea,conexion.getBase(), "tarea");
		statusModifTarea=statusModifTarea+adminModif.reasignarSubtareas(tareaDelete, nuevaTarea);
		
		if(statusModifTarea==3){
			%><script type="text/javascript">alert("Datos modificados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}else{
			%><script type="text/javascript">alert("Los datos no se modificaron, intente de nuevo...");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}
	}catch(Exception e){
		out.println("Error, compruebe los datos suministrados e intente de nuevo... :\n "+e.getMessage());
		
		%><a href="MenuABM.jsp" >Volver a ABM</a><%
		
	}
	
	
	
	
	
	
		
	}//fin si es para modificacion de tarea
	
	
	
	
	
	
}//fin si viene de abmtarea

else if(session.getAttribute("solicitaAbm").equals("AbmSubTarea")){//inicio si viene de AbmSubTarea
	//out.println("vino de AbmSubTarea");
	
	if(session.getAttribute("accion").equals("Alta")){//inicio si es para alta Subtarea
		metodosSql metodos=new metodosSql();
		
		String nombreTareaPadre=request.getParameter("tareas").toString();
		String idTarPadre=metodos.consultarUnaColumna("SELECT idTarea FROM proyectoweb.tarea where descripcion='"+nombreTareaPadre+"';").get(0);
		int idTareaPadre=Integer.parseInt(idTarPadre);
	
		Subtarea subTar=new Subtarea(Integer.parseInt(request.getParameter("numeroSubTarea")),idTareaPadre,  request.getParameter("subTarea").toString().toUpperCase());
		//usando upper case por primera vez en el proyecto
		if(admin.darDeAlta(subTar, "proyectoweb", "subtarea")==1){
			%><script type="text/javascript">alert("Datos cargados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
		}		
		
		else{
			
			%><script type="text/javascript">alert("Hubo un problema, intente de nuevo por favor.");
			
			 document.location=("MenuABM.jsp");
			</script><%		
			
		}
		
		
	}//fin si es para alta tarea
	
	
	
	
	
	//si viene de baja hacer..
	if(session.getAttribute("accion").equals("Baja")){//inicio si es para baja subtarea
		int statusBajaSubtarea=0;
		AdministradorABM adminBaja=new AdministradorABM();
		metodosSql metodos=new metodosSql();
		out.println("baja");
		
		String subTarea=URLDecoder.decode(request.getParameter("subtareas"), "UTF-8");
		
		
		
		
		String sentencia="Select idsubTarea from subtarea where descripcion='"+subTarea+"' and inHabilitado='NO';";
		int idSubTarea=Integer.parseInt(metodos.consultarUnaColumna(sentencia).get(0));
		Subtarea subTareaDelete=new Subtarea(idSubTarea, subTarea);
		
		statusBajaSubtarea= adminBaja.InHabilitar(subTareaDelete,conexion.getBase(),"subtarea");
		if(statusBajaSubtarea==1){
			%><script type="text/javascript">alert("Datos borrados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}else{
			%><script type="text/javascript">alert("Los datos no se borraron, intente de nuevo...");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}
		
		
		
	}//fin si es para baja subtarea	
	
	if(session.getAttribute("accion").equals("Modificacion")){//inicio si es para modificacion de subtarea
		out.println("modificacion");
	try{
		//´+´+
		int statusModifSubTarea=0;
		AdministradorABM adminModif=new AdministradorABM();
		metodosSql metodos=new metodosSql();
		
		
		
		String subTarea=URLDecoder.decode(request.getParameter("subTareas"), "UTF-8");
		
		
		
		
		
		int idSubTarea=Integer.parseInt(metodos.consultarUnaColumna("SELECT max(idsubTarea) FROM proyectoweb.subtarea;").get(0));
		idSubTarea++;
		int idSubTareaDel=Integer.parseInt(metodos.consultarUnaColumna("SELECT idSubTarea FROM proyectoweb.subtarea where descripcion= '"+subTarea+"' and inHabilitado='NO';").get(0));
		int idtareaPadre=Integer.parseInt(metodos.consultarUnaColumna("SELECT tareaPadre FROM proyectoweb.subtarea where idSubTarea= '"+idSubTareaDel+"' ;").get(0));
		String nuevaDescripcionTarea=request.getParameter("nuevoValor");
		Subtarea nuevaSubTarea=new Subtarea(idSubTarea,nuevaDescripcionTarea);
		Subtarea subTareaDelete=new Subtarea(idSubTareaDel,subTarea);
		subTareaDelete.setTareaPadre(idtareaPadre);
		nuevaSubTarea.setTareaPadre(subTareaDelete.getTareaPadre());
		
		statusModifSubTarea= adminModif.InHabilitar(subTareaDelete,conexion.getBase(),"subtarea");
		statusModifSubTarea=statusModifSubTarea+adminModif.darDeAlta(nuevaSubTarea,conexion.getBase(), "subtarea");
		statusModifSubTarea=statusModifSubTarea+adminModif.InHabilitar(subTareaDelete, conexion.getBase(), "subtarea");
		
		if(statusModifSubTarea==3){
			%><script type="text/javascript">alert("Datos modificados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}else{
			%><script type="text/javascript">alert("Los datos no se modificaron, intente de nuevo...");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}
	}catch(Exception e){
		out.println("Error, compruebe los datos suministrados e intente de nuevo... :\n "+e.getMessage());
		
		%><a href="MenuABM.jsp" >Volver a ABM</a><%
		
	}
	
	
	
	
	
	
		
	}//fin si es para modificacion de subtarea
	
	
	
	
	
	
}//fin si viene de abmSubtarea

else if(session.getAttribute("solicitaAbm").equals("AbmDepto")){//inicio si viene de AbmDepartamento
	//out.println("vino de AbmDepartamento");
	
	if(session.getAttribute("accion").equals("Alta")){//inicio si es para alta Departamento
		
		Departamento _depto=new Departamento(Integer.parseInt(request.getParameter("numerodepartamento")),request.getParameter("departamento").toString().toUpperCase());
		//usando upper case por primera vez en el proyecto
		if(admin.darDeAlta(_depto, "proyectoweb", "Departamento")==1){
			%><script type="text/javascript">alert("Datos cargados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
		}		
		
		else{
			
			%><script type="text/javascript">alert("Hubo un problema, intente de nuevo por favor.");
			
			 document.location=("MenuABM.jsp");
			</script><%		
			
		}
		
		
	}//fin si es para alta Departamento
	
	
	
	
	
	//si viene de baja hacer..
	if(session.getAttribute("accion").equals("Baja")){//inicio si es para baja Departamento
		int statusBajaCliente=0;
		AdministradorABM adminBaja=new AdministradorABM();
		metodosSql metodos=new metodosSql();
		out.println("baja");
		
		String Departamento=URLDecoder.decode(request.getParameter("departamentos"), "UTF-8");
		
		
		
		
		String sentencia="Select idDepartamento from Departamento where descripcion='"+Departamento+"' and inHabilitado='NO';";
		int idDepartamento=Integer.parseInt(metodos.consultarUnaColumna(sentencia).get(0));
		Departamento DepartamentoDelete=new Departamento(idDepartamento, Departamento);
		
		statusBajaCliente= adminBaja.InHabilitar(DepartamentoDelete,conexion.getBase(),"Departamento");
		if(statusBajaCliente==1){
			%><script type="text/javascript">alert("Datos borrados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}else{
			%><script type="text/javascript">alert("Los datos no se borraron, intente de nuevo...");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}
		
		
		
	}//fin si es para baja Departamento	
	
	if(session.getAttribute("accion").equals("Modificacion")){//inicio si es para modificacion Departamento
		out.println("modificacion");
	try{
		int statusModifDepartamento=0;
		AdministradorABM adminModif=new AdministradorABM();
		metodosSql metodos=new metodosSql();
		
		
		
		String Departamento=URLDecoder.decode(request.getParameter("departamentos"), "UTF-8");
		
		
		
		
		
		int idDepartamento=Integer.parseInt(metodos.consultarUnaColumna("SELECT max(idDepartamento) FROM proyectoweb.Departamento;").get(0));
		idDepartamento++;
		int idDepartamentoDel=Integer.parseInt(metodos.consultarUnaColumna("SELECT idDepartamento FROM proyectoweb.Departamento where descripcion= '"+Departamento+"' and inHabilitado='NO';").get(0));
		String nuevaDescripcionDepartamento=request.getParameter("nuevoValor");
		Departamento nuevaDepartamento=new Departamento(idDepartamento,nuevaDescripcionDepartamento);
		Departamento DepartamentoDelete=new Departamento(idDepartamentoDel,Departamento);
		
		statusModifDepartamento= adminModif.InHabilitar(DepartamentoDelete,conexion.getBase(),"Departamento");
		statusModifDepartamento=statusModifDepartamento+adminModif.darDeAlta(nuevaDepartamento,conexion.getBase(), "Departamento");
		
		
		if(statusModifDepartamento==2){
			%><script type="text/javascript">alert("Datos modificados con éxito!");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}else{
			%><script type="text/javascript">alert("Los datos no se modificaron, intente de nuevo...");
			 document.location=("MenuABM.jsp");//redireccion 
			
			</script><%
			
		}
	}catch(Exception e){
		out.println("Error, compruebe los datos suministrados e intente de nuevo... :\n "+e.getMessage());
		
		%><a href="MenuABM.jsp" >Volver a ABM</a><%
		
	}
	
	
	
	
	
	
		
	}//fin si es para modificacion de Departamento
	
	
	
	
	
	
}//fin si viene de abmDepartamento




%>



</body>
</html>