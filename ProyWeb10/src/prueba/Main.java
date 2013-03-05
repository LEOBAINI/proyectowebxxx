package prueba;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import sun.security.jca.GetInstance;

import jxl.write.DateTime;

import Abm.*;
import Base.ConexionMySql;
import Base.metodosSql;
import Excel.EscrituraExcel;

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
		metodosSql metodos=new metodosSql();
		/*ConexionMySql conexion=new ConexionMySql();
		String base=conexion.getBase();
		String tabla="subtarea";
		
		Subtarea sub=new Subtarea(15, 1, "uyftydty");
		
		ejecutarPruebasABM(sub, base, tabla);*/
		EscrituraExcel esc=new EscrituraExcel();
		String usuario="pepi";
		
		ArrayList<ArrayList<String>>matriz=metodos.consultar("SELECT * FROM userLogin");
		String rutaDestino="d:\\DescargasProyWeb10\\Excel\\";
		
		
		esc.crearExcelDesdeMatriz(matriz, rutaDestino, usuario);
		
		
		
		
		
		
		
		
		
		
		
		}
		
		

	}

