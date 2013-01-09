<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*"  %>
     <%@page import="Excel.*"  %>
     <%@page import="java.util.ArrayList"  %>
     <%@page import="Base.*"  %>
      <%@page session="true"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
try
{
	//opciones disponibles
	//matrizNoFiltrada
	//matrizFiltrada
	
	/**Preguntar, viene con filtro la consulta?
			
			si si{
				es administrador?{
				consulta con filtro administrador
				}si no{
				consulta con filtro usuario
				}
		   }si no{
				es administrador?{
				consulta sin filtro para administrador
			
			}sino{
				consulta sin filtro para usuario
		}
	}
	*
	*
	*
	*/
	
	String filtrar=session.getAttribute("filtrar").toString();
	String nivelAcceso=session.getAttribute("permiso").toString();
	String rutaAlArchivo=null;	
    ArrayList<ArrayList<String>>matrix=null;
   
    
	metodosSql metodos=new metodosSql();
    //String nFile = "BUSTAMANTE.xls";	
    if(filtrar.equals("si")){
    	
    	if(nivelAcceso.equals("administrador")){
    		matrix=metodos.consultar(session.getAttribute("consultaAdministradorFiltro").toString());
    	}else{
    		matrix=metodos.consultar(session.getAttribute("consultaUsuarioFiltro").toString());
    	}
    	
    }else{
    	
		if(nivelAcceso.equals("administrador")){
			
			matrix=metodos.consultar(session.getAttribute("consultaAdministrador").toString());
    		
    	}else{
    		matrix=metodos.consultar(session.getAttribute("consultaUsuario").toString());
    		
    	}
    	
    }
    
   
    
    
    
    	
    EscrituraExcel esc=new EscrituraExcel();
    //cabecera matriz NRO REGISTRO TAREA SUBTAREA DESCRIPCION DEPARTAMENTO USUARIO CLIENTE HS TIPO HS FECHA ESTADO 
    ArrayList<String>cabecera=new ArrayList<String>();
    cabecera.add("NRO REGISTRO");
    cabecera.add("TAREA");
    cabecera.add("SUBTAREA");
    cabecera.add("DESCRIPCION");
    cabecera.add("DEPARTAMENTO");
    cabecera.add("USUARIO");
    cabecera.add("CLIENTE");
    cabecera.add("HS");
    cabecera.add("TIPO HS");
    cabecera.add("FECHA");
    cabecera.add("ESTADO");
    matrix.add(0, cabecera);
    
    
    FileInputStream archivo = new FileInputStream(rutaAlArchivo=esc.crearExcelDesdeMatriz(matrix,"C:\\DescargasPWEB\\", session.getAttribute("usuario").toString()));//"C:/"+nFile); 
    int longitud = archivo.available();
    byte[] datos = new byte[longitud];
    archivo.read(datos);
    archivo.close();
    
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition","attachment;filename="+rutaAlArchivo);//nFile);   
   
    
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(datos);
    ouputStream.flush();
    ouputStream.close();
 
    	
  
    	

   
 
    
   
    
    
    	
}
catch(IllegalStateException il){
	System.out.println(il.getMessage());
	
}
catch(IOException io){
	System.out.println(io.getMessage());
	
}
catch(Exception e)
{ 
	System.out.println(e.getMessage());
}


	


%>


</body>
</html>

