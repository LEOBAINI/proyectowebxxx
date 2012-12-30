 

 
import java.io.*;

import java.util.*;

import java.net.*;

import java.sql.*;

import javax.servlet.*;

import javax.servlet.http.*;
import javax.swing.JOptionPane;

import com.sun.org.apache.bcel.internal.generic.NEWARRAY;
import com.sun.xml.internal.ws.api.addressing.WSEndpointReference.Metadata;


 
public class ConsultaDB extends HttpServlet

{
	private String devolverRestaDeHora(String hora1,String hora2){
		String aux=null;
		int temp=0;
		StringTokenizer a=new StringTokenizer(hora1);
		StringTokenizer b=new StringTokenizer(hora2);
		
int hora_a=Integer.parseInt(a.nextToken(":"))*60;
int hora_b=Integer.parseInt(b.nextToken(":"))*60;
int minuto_a=Integer.parseInt(a.nextToken(":"));
int minuto_b=Integer.parseInt(b.nextToken(":"));
hora_a=hora_a+minuto_a;
hora_b=hora_b+minuto_b;
temp=hora_b-hora_a;
int horaFinal=0;
int minutoFinal=0;
if(temp>60){
while(temp>60){
	temp=temp-60;
	horaFinal++;
	minutoFinal=temp;
}
aux=String.valueOf(horaFinal+":"+minutoFinal+":00");

}else{
	
	aux=String.valueOf(horaFinal+":"+temp+":00");
}
		
		return aux;
	}

// globales se ocupan varias veces

PrintWriter pagina;


Connection conexion = null;

ResultSet resulset= null;

Statement sentenciaStatement=null;

String direccionDeLaBase = IpBase.direccionBase;

String tipoDriver= IpBase.driverMasRuta;

public void doPost (HttpServletRequest request,

HttpServletResponse response)

throws ServletException, IOException

{

pagina =response.getWriter();

response.setContentType("text/html");

pagina.println("<HTML>");

try {	
		
Class.forName(IpBase.driver);

conexion=DriverManager.getConnection(IpBase.direccionBase,IpBase.usuarioBase,IpBase.passBase);

sentenciaStatement = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

int clave=0;
System.out.println();
if(request.getParameter("CLAVE")!="")
clave = Integer.parseInt(request.getParameter("CLAVE"));


String q;
if(clave==0){
	 q="select * from regdetareas" ;
}else{
	 q="select * from regdetareas where dniPersonal="+clave ;
}

try { 

	
if(request.getParameterValues("option1")==null){
	System.out.println("option1 No está apretado");
	
}else{
	System.out.println("option1 si esta apretado");
}
if(request.getParameterValues("option2")==null){
	System.out.println("option2 No está apretado");
	
}else{
	System.out.println("option2 si esta apretado");
}
if(request.getParameterValues("option3")==null){
	System.out.println("option3 No está apretado");
	
}else{
	System.out.println("option3 si esta apretado");
}
	
	
	
	
	
	
	
	
	
resulset = sentenciaStatement.executeQuery(q);
java.sql.ResultSetMetaData metadatos= resulset.getMetaData();

pagina.println("<TABLE Border=10 CellPadding=5><TR>");
									//si se coloca el nombre que fig en la base
pagina.println("<th bgcolor=#819FF7>"+metadatos.getColumnName(1)+"</th><th bgcolor=#819FF7>"+metadatos.getColumnName(2)+"</th><th bgcolor=#819FF7>"+metadatos.getColumnName(3).toString()+"</th>"
+ "<th bgcolor=#819FF7>"+metadatos.getColumnName(4).toString()+"</th><th bgcolor=#819FF7>"+metadatos.getColumnName(5)+"</th><th bgcolor=#819FF7>"+metadatos.getColumnName(6)+"</th>" +
		"<th bgcolor=#819FF7>"+metadatos.getColumnName(7)+"</th><th bgcolor=#819FF7>"+metadatos.getColumnName(8)+"</th><th bgcolor=#819FF7>"+metadatos.getColumnName(9)+"</th>" +
				"<th bgcolor=#01DF3A>"+metadatos.getColumnName(10)+"</th><th bgcolor=#819FF7>"+metadatos.getColumnName(11)+"</th></TR>");
ArrayList<String> sentencias=new ArrayList<String>();
sentencias.add("");
ArrayList<String>horasAsumar=new ArrayList<String>();
if(clave==0){

while(resulset.next()) {

	pagina.println("<TR>");
	String nroRegistro=resulset.getString(1);
	pagina.println("<TD>"+nroRegistro+"</TD>");

	pagina.println("<TD>"+resulset.getString(2)+"</TD>");
	
	pagina.println("<TD>"+resulset.getString(3)+"</TD>");

	pagina.println("<TD>"+resulset.getString(4)+"</TD>");
	
	pagina.println("<TD>"+resulset.getString(5)+"</TD>");
	
	pagina.println("<TD>"+resulset.getString(6)+"</TD>");
	
	pagina.println("<TD>"+resulset.getString(7)+"</TD>");
	
	pagina.println("<TD>"+resulset.getString(8)+"</TD>");
	
	pagina.println("<TD>"+resulset.getString(9)+"</TD>");
	
		
	String aux=devolverRestaDeHora(resulset.getString(8),resulset.getString(9));
	horasAsumar.add(aux);
	
	
	pagina.println("<TD>"+aux+"</TD>");//	10
	
	pagina.println("<TD>"+resulset.getString(11)+"</TD>");
	
	//pagina.println("<TD>"+resulset.getString(10)+"</TD>");
	sentencias.add("UPDATE `regdetareas` SET `horasConsumidas`='"+aux+"' WHERE `nroRegistro`='"+nroRegistro+"'; " );
	
	pagina.println("</TR>"); }; // fin while
	
	

	
	
	
	pagina.println("</TABLE></CENTER></DIV>");
	
	pagina.println("<br><h4>El total de horas consumidas para esta consulta es : "+MetodosEstaticos.sumarHoras(horasAsumar)+"</h4></HTML>");
	

	resulset.close();
	sentenciaStatement = conexion.createStatement();
	for(int i=1;i<sentencias.size();i++){
		sentenciaStatement.executeUpdate(sentencias.get(i));
		
	}
	sentenciaStatement.close();
	} //fin try no usar ; al final de dos o mas catchs
	


else {
	while(resulset.next()) {

		pagina.println("<TR>");

		pagina.println("<TD>"+resulset.getString(1)+"</TD>");

		pagina.println("<TD>"+resulset.getString(2)+"</TD>");
		
		pagina.println("<TD>"+resulset.getString(3)+"</TD>");

		pagina.println("<TD>"+resulset.getString(4)+"</TD>");
		
		pagina.println("<TD>"+resulset.getString(5)+"</TD>");
		
		pagina.println("<TD>"+resulset.getString(6)+"</TD>");
		
		pagina.println("<TD>"+resulset.getString(7)+"</TD>");
		
		pagina.println("<TD>"+resulset.getString(8)+"</TD>");
		
		pagina.println("<TD>"+resulset.getString(9)+"</TD>");
		
		pagina.println("<TD>"+resulset.getString(10)+"</TD>");

		pagina.println("</TR>"); }; // fin while

		pagina.println("</TABLE></CENTER></DIV></HTML>");

		resulset.close();
}
}

catch(SQLException e) {System.out.println(e.getMessage());};

try {conexion.close();} catch(SQLException e) {System.out.println(e.getMessage());};

pagina.println("</HTML>");

pagina.close();

};

public void destroy(){super.destroy();};

}







































/*
 
 


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String clave = req.getParameter("CLAVE");
		try {
			response(resp,clave);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			resp.sendError(1111111);
			e.printStackTrace();
		}
	}
	
	private void response(HttpServletResponse resp, String msg)
	
			throws IOException, SQLException {
		msg="";
		PrintWriter out = resp.getWriter();
		ConexionMySql.desconectar();
		ConexionMySql.conectar();		
		ConexionMySql.resulsete=ConexionMySql.statemente.executeQuery("select * from mascota");
		
		
		
		//metodosSql.consultarGral("select * from ungs.ma5scota");
		//while(ConexionMySql.resulsete.next()){
			//String a=ConexionMySql.resulsete.getString(1);
			System.out.println("Hola!!!!!!!!!!!!!!");
			ConexionMySql.desconectar();
			
			
			
			
			out.println("<html>");
			out.println("<body>");
			out.println("<t1>" + msg + "</t1>");	
			out.println("</body>");
	    	out.println("</html>");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String user = req.getParameter("user");
		String pass = req.getParameter("password");
		if ("o".equals(user) && "o".equals(pass)) {
			response(resp, "Logeo ok");
		} else {
			response(resp, "Logeo inválidoooooo");
		}
	}
	
	private void response(HttpServletResponse resp, String msg)
			throws IOException {
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<t1>" + msg + "</t1>");
		out.println("</body>");
		out.println("</html>");
	}*/
	
	
	
	
	
//}