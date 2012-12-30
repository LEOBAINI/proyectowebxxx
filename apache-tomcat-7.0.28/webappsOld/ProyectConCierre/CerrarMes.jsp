<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.Choice"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Base.metodosSql"%>
<%@page import="java.util.StringTokenizer"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cerrar mes</title>
</head>
<body>
<% 

int estado=0;
metodosSql metodos=new metodosSql();
//String a=JOptionPane.showInputDialog(null, "Que periodo cierra? MM-AAAA");



String opciones[]=new String [12];
opciones[0]="ENERO";
opciones[1]="FEBRERO";
opciones[2]="MARZO";
opciones[3]="ABRIL";
opciones[4]="MAYO";
opciones[5]="JUNIO";
opciones[6]="JULIO";
opciones[7]="AGOSTO";
opciones[8]="SEPTIEMBRE";
opciones[9]="OCTUBRE";
opciones[10]="NOVIEMBRE";
opciones[11]="DICIEMBRE";



int mes=0;
String mesString;
mes=JOptionPane.showOptionDialog(null, "Seleccione el mes que desea cerrar", "Cierre de mes", JOptionPane.DEFAULT_OPTION,JOptionPane.INFORMATION_MESSAGE,null, opciones,null);
mes=mes+1;
mesString=String.valueOf(mes);




if(mesString.length()<2){
	mesString="0"+mesString;
}


estado=metodos.insertarOmodif("UPDATE `proyectoweb`.`registrogral`"+
		" SET `estado`='CERRADO' WHERE dnipersonal= 258963 and "+
		metodos.damePeriodo(mes, Integer.parseInt(metodos.dameAnio()),"fecha"));



out.println("SENTENCIA EJECUTADA :  UPDATE `proyectoweb`.`registrogral`"+
		" SET `estado`='CERRADO' WHERE dnipersonal= 258963 \n and "+metodos.damePeriodo(mes, Integer.parseInt(metodos.dameAnio()),"fecha"));
if(estado==1){
	

out.println("<BR><BR>Sentencia ejecutada correctamente con  opcion "+mesString +" año "+metodos.dameAnio());
out.println("Para realizar cambios o modificaciones solicíte a su administrador que abra el periodo correspondiente.");
}else{
	out.println("Error al actualizar el cierre de mes");
}

%>
<br>
<br>
<a href="MenuPpal.jsp">Volver a menu</a>

</body>
</html>