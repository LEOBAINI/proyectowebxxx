package Base;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;

import java.util.Locale;

public class metodosSql extends ConexionMySql {
	
	public metodosSql() {
	}
	
	public String damePeriodo(int periodo,int anio,String atributoTabla){
	
		
		String SQLperiodo = null;
		String anioString=String.valueOf(anio);
		switch(periodo){
			case 1:SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"01-01' and "+atributoTabla+" < ' "+anioString+"-02-01'";break;
			case 2:SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"02-01' and "+atributoTabla+" < ' "+anioString+"-03-01'";break;
			case 3:SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"03-01' and "+atributoTabla+" < ' "+anioString+"-04-01'";break;
			case 4:SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"04-01' and "+atributoTabla+"  < ' "+anioString+"-05-01'";break;
			case 5:SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"05-01' and "+atributoTabla+"  < ' "+anioString+"-06-01'";break;
			case 6:SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"06-01' and "+atributoTabla+"  < ' "+anioString+"-07-01'";break;
			case 7:SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"07-01' and "+atributoTabla+"  < ' "+anioString+"-08-01'";break;
			case 8:SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"08-01' and "+atributoTabla+"  < ' "+anioString+"-09-01'";break;
			case 9:SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"09-01' and "+atributoTabla+"  < ' "+anioString+"-10-01'";break;
			case 10:SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"10-01' and "+atributoTabla+"  < ' "+anioString+"-11-01'";break;
			case 11:SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"11-01' and "+atributoTabla+"  < ' "+anioString+"-12-01'";break;
			
			
			case 12:
				int anioMasUno=Integer.parseInt(anioString);
				anioMasUno=anioMasUno+1;
				SQLperiodo=atributoTabla+" >= '"+anioString+"-"+"12-01' and "+atributoTabla+"  < ' "+anioMasUno+"-01-01'";break;
		}
		
		
		return SQLperiodo;
		
	}
		
	public String dameFechaDeHoy(){
		 SimpleDateFormat formateador = new SimpleDateFormat("yyyy'-'MM'-'dd", new Locale("es_ES"));
		 Date fechaDate = new Date();
          String fecha=formateador.format(fechaDate);
	
	return fecha;
	}
	public String dameAnio(){
		 SimpleDateFormat formateador = new SimpleDateFormat("yyyy", new Locale("es_ES"));
		 Date fechaDate = new Date();
         String fecha=formateador.format(fechaDate);
	
	return fecha;
	}

	public int insertarOmodif(String sentenciaSql) {
		int status=0;
		ConexionMySql con = new ConexionMySql();

		try {
			con.conectar();
			con.statemente.executeUpdate(sentenciaSql);

			con.desconectar();
			status=1;

		} catch (SQLException e) {
			System.out.println("Error en insertarOmodificar");
			System.out.println(e.getMessage());
			e.printStackTrace();
			con.desconectar();
			status=-1;
		}
		return status;

	}

	public ArrayList<ArrayList<String>> consultar(String SentenciaSql) {
		ResultSet res =null;
		ArrayList<ArrayList<String>> matriz = new ArrayList<ArrayList<String>>();//creo una matriz
		
		
		ConexionMySql con = new ConexionMySql();
		
		
		try {
			con.conectar();
			con.resulsete=con.statemente.executeQuery(SentenciaSql);
			res = con.resulsete;
			ResultSetMetaData rmd = res.getMetaData(); //guardo los datos referentes al resultset
			
			 
	            while ( res.next()){
	                    ArrayList<String> columnas = new ArrayList<String>();
	                     for (int i=1; i<=rmd.getColumnCount(); i++) {
	                             columnas.add(res.getString(i));
	                     }
	                     matriz.add(columnas);
	            }
	        con.desconectar();

			

		} catch (Exception e) {
			System.out.println("Error en metodosSql.consultar"+e.getMessage());
			System.out.println(e.getLocalizedMessage());
			
		}

		return matriz;
		

	}
	
		
		
	
	public ArrayList<String>consultarUnaColumna(String SentenciaSql) {
		ResultSet res =null;
		ArrayList<String> arreglo = new ArrayList<String>();//creo una matriz
		
		
		ConexionMySql con = new ConexionMySql();
		
		
		try {
			con.conectar();
			con.resulsete=con.statemente.executeQuery(SentenciaSql);
			res = con.resulsete;
			
			
			 
	            while ( res.next()){
	            	
	                arreglo.add(res.getString(1));
	            }
	        con.desconectar();

			

		} catch (Exception e) {
			System.out.println("Error en metodosSql.consultarUnaColumna"+e.getMessage());
			
		}

		return arreglo;
		

	}

}
