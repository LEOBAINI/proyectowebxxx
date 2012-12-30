package prueba;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.StringTokenizer;

import Base.ConexionMySql;
import Base.metodosSql;

public class Main {
	public static String validarUsuario(String usuario,String contrasenia){
		String permiso=null;
		int columnaUser=0;
		int columnaPass=1;
		int columnaPermiso=2;
		int flag=0;
		ArrayList<ArrayList<String>> matriz;
				
		metodosSql m=new metodosSql();
		matriz=m.consultar("select * from userlogin");
		for(int i=0;i<matriz.size();i++){
			if(matriz.get(i).get(columnaUser).equals(usuario)){
				if(matriz.get(i).get(columnaPass).equals(contrasenia)){
					/*System.out.println("Usuario correcto");
					System.out.println(matriz.get(i).get(columnaUser));
					System.out.println(matriz.get(i).get(columnaPass));
					System.out.println(matriz.get(i).get(columnaPermiso));*/
					permiso=matriz.get(i).get(columnaPermiso);
					//flag=1;
				}
			}
			
		}
		/*if(flag==0){
			System.out.println("usuario incorrecto intente de nuevo");
		}*/
		return permiso;
	}

	/**
	 * @param args
	 */
	
	public static void main(String[] args) {
		/*ResultSet r=null;
		ArrayList<ArrayList<String>> matriz;
		
		
		metodosSql m=new metodosSql();
		matriz=m.consultar("select * from userlogin");
		//System.out.println(matriz.get(0).get(1));
		/*System.out.println(validarUsuario("administrador","coinse"));
		System.out.println(validarUsuario("leo","patagon1an"));
		System.out.println(validarUsuario("claudio","bustamante"));*/
		/*metodosSql metodos=new metodosSql();
		String user="'leo'";
		int dni=Integer.parseInt(metodos.consultarUnaColumna("select dni from userlogin where usuario = "+user).get(0));
		System.out.println(dni);*/
		String usuario="alberto";
		metodosSql m2=new metodosSql();
		ArrayList<ArrayList<String>> matriz;
		matriz=m2.consultar("" +
				"SELECT idregistrogral,tarea,subtarea,descripcion,departamento, "+
				" cliente,horastrabajadas,tipohora,fecha "+
				" FROM registrogral"+
				" where dniPersonal = (select dni from userlogin  where usuario= '"+usuario+"')");
		
		StringTokenizer a;
		


		     
		
		
		
		
	}

}
