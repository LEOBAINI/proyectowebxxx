package prueba;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import Abm.*;
import Base.ConexionMySql;
import Base.metodosSql;

public class Main {
	
	
	
	
	
	
	
	
	
	private HashMap<String, ArrayList<String> > contenido;
	/**
	 * @param args
	 */
	
	public static void ejecutarPruebasABM(Persistente objeto,String base,String tabla){
		int status=0;
		AdministradorABM admin=new AdministradorABM();
		
		status=admin.darDeBaja(objeto, base, tabla);
		
		
		status=status+admin.darDeAlta(objeto, base, tabla);
		
		
		status=status+admin.modificar(objeto, base, tabla);
		
		
		status=status+admin.darDeBaja(objeto, base, tabla);
		
		if(status==4){
			System.out.println("ejecutado correctamente");
		}else{
			System.out.println("Atenci�n hay fallas!!!");
		}
		
		
	}
	public static void main(String[] args) {
		ConexionMySql conexion=new ConexionMySql();
		String base=conexion.getBase();
		String tabla="subtarea";
		
		Subtarea sub=new Subtarea(15, 1, "uyftydty");
		
		ejecutarPruebasABM(sub, base, tabla);
		
		
		
		
		
		
		}
		
		

	}


