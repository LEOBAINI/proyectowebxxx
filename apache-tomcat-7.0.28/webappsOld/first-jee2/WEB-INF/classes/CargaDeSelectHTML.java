
import java.io.*;

import java.util.*;

import java.net.*;

import java.sql.*;

import javax.servlet.*;

import javax.servlet.http.*;
import javax.swing.JOptionPane;

public class CargaDeSelectHTML extends HttpServlet

{

// globales se ocupan varias veces

PrintWriter pagina;
 
Connection conexion = null;

ResultSet resulset= null;

Statement sentenciaStatement=null;

String direccionDeLaBase = IpBase.direccionBase;

String tipoDriver= IpBase.driverMasRuta;

//esta funcion es usada por selectSimple()
private static void cargarSelect(PrintWriter pagina,String nombre,ArrayList<String> datos){
	int i=1;
	
	pagina.println("<br>");
	pagina.println("<select name="+nombre+">");
	pagina.println("<option value=0>"+nombre+"</option>");/////borrar si sale mal
	while(i<datos.size()){
	pagina.println("<option value="+i+">"+datos.get(i)+"</option>");
	i++;
	}
	pagina.println("<br></select>");
}





//Esta funcion transforma un resulset en un arrayList<String>
private static ArrayList<String> resulset(ResultSet resul){
	ArrayList<String>aux=new ArrayList<String>();
	aux.add("");
	try {
		while(resul.next())
			try {
				aux.add(resul.getString(1));
			} catch (SQLException e) {
				JOptionPane.showMessageDialog(null, e.getMessage());
				e.printStackTrace();
			}
	} catch (SQLException e) {
		JOptionPane.showMessageDialog(null, e.getMessage());
		e.printStackTrace();
	}
	return aux;
}



//con esta funcion se crean los select " campos de seleccion "
public static void selectSimple(Statement s,Connection c,ResultSet resulset,PrintWriter p,String nombre,String sentenciaSQL){
	 try {
		s = c.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		try {
			resulset = s.executeQuery(sentenciaSQL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cargarSelect(p,nombre, resulset(resulset));
		try {
			resulset.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}






public void doPost (HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{

pagina =response.getWriter();

response.setContentType("text/html");

pagina.println("<HTML>");
pagina.println("<body><form action=login.html method=post>");

try {	
		
Class.forName(IpBase.driver);

conexion=DriverManager.getConnection(IpBase.direccionBase,IpBase.usuarioBase,IpBase.passBase);

sentenciaStatement = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){System.out.println(e.getMessage());} catch(SQLException e) {System.out.println(e.getMessage());}



/*pagina =response.getWriter();

response.setContentType("text/html");

pagina.println("<HTML>");*/


//int clave = Integer.parseInt(request.getParameter("CLAVE"));

String q="select * from personal";// where clave="+clave;

try { resulset = sentenciaStatement.executeQuery(q);

pagina.println("<a href=inicio.html>Volver al inicio</a><br><br><br><br>");

pagina.println("Seleccione las opciones correspondientes<br>");

pagina.println("<select name=dni>");
pagina.println("<option value=0>Nombre del personal</option>");
int i=1;
while(resulset.next()){//carga el select de html con los valores de la los nombres de personal de mysql
pagina.println("<option value="+i+">"+resulset.getString(4)+" "+resulset.getString(5)+"</option>");

i++;
}
pagina.println("<br></select>");
resulset.close();





selectSimple(sentenciaStatement, conexion, resulset, pagina, "Elija un Cliente", "select descripcion from cliente");
selectSimple(sentenciaStatement, conexion, resulset, pagina, "Elija un Mes", "select nombre from mes");
selectSimple(sentenciaStatement, conexion, resulset, pagina, "Elija un Dia", "select dia from dia");
selectSimple(sentenciaStatement, conexion, resulset, pagina, "Elija un Tipo de hora", "select descripcion from TipoHora");
selectSimple(sentenciaStatement, conexion, resulset, pagina, "Elija un Departamento", "select descripcion from departamento");
selectSimple(sentenciaStatement, conexion, resulset, pagina, "Elija una Tarea", "select descripcion from tarea");
selectSimple(sentenciaStatement, conexion, resulset, pagina, "Elija una Subtarea", "select descripcion from subtarea");
pagina.println("<br>Dato adicional:<br>"+
"<textarea name=comentarios rows=5 cols=60></textarea>"+ 
"<br>"+
"<input type=submit value=Aceptar>");


pagina.println("</body>");

conexion.close();

} catch(SQLException e) {
	System.out.println(e.getMessage());;}
catch(Exception ex){
	System.out.println(ex.getMessage());}



pagina.println("</HTML>");

pagina.close();

};

public void destroy(){super.destroy();};

}


