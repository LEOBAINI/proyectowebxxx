
import java.awt.Dimension;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.ListSelectionModel;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

import com.mysql.jdbc.ResultSetMetaData;
import com.sun.xml.internal.ws.api.addressing.WSEndpointReference.Metadata;

public class metodosSql extends ConexionMySql {
	public metodosSql(){}
	
protected static void insertarMascota(
		String nombre,
		String alergia,
		String actSexual,
		String color,
		String nroTipoMascota,//parsear
		String juguete,
		String alimento,
		String nroCantidadali,//parsear
		String profesionalLeg,//parsear
		String nofoto,
		String agresivo,
		String cuidadoEspecial,
		String medicacion,
		String pesoKG,//parsear
		String fechaNac,//aa-mm-dd 
		String raza,
		String padreLegajo,//parsear
		String madreLegajo,//parsear		
		String esTransaccionable
		){
	String mascota=" mascota";
	
	try {
		
		int nrotipoMascota=1;//Integer.parseInt(nroTipoMascota);
		int nrocantidadali=0;//Integer.parseInt(nroCantidadali);
		int profesionalleg=Integer.parseInt(profesionalLeg);
		int peso=0;//Integer.parseInt(pesoKG);
		int madrelegajo=0;//Integer.parseInt(madreLegajo);
		int padrelegajo=0;//Integer.parseInt(padreLegajo);
		
		statemente.executeUpdate("INSERT INTO "+mascota+" (nombremasc, alergia, actividadsexual, color, nrotipomascota, juguete, alimento, nrocantidadali, profesionalLeg, foto, agresivo, cuidadoespecial, medicacion, peso, fechnacdate, raza, padreleg, madreleg,transaccionable)" +
				"                                   VALUES ('"+nombre+"', '"+alergia+"', '"+actSexual+"', '"+color+"', "+ nrotipoMascota +", '"+juguete+"', '"+alimento+"', "+ nrocantidadali + ", "+profesionalleg+", '"+nofoto+"', '"+agresivo+"', '"+cuidadoEspecial+"', '"+medicacion+"', "+peso+", '"+fechaNac+"', '"+raza+"', "+madrelegajo+", "+padrelegajo+", '"+esTransaccionable+"')");
				
		JOptionPane.showMessageDialog(null,"Guardado con éxito en la base!");
	    }
	catch (SQLException ex) {
		//ex.getLocalizedMessage();
		System.out.println(ex.getMessage());
		//Logger.getLogger(metodosSql.class.getName()).log(Level.SEVERE, null, ex);
	    }

}
public static String[] dameMedicos(){
	String[] medicos = null;
	ArrayList <String>lista=new ArrayList<String>();
	try{
	ConexionMySql.conectar();
	ConexionMySql.resulsete=ConexionMySql.statemente.executeQuery("select apellido,nombre from profesional");
	String aux;
	
	while(ConexionMySql.resulsete.next()){
		aux=resulsete.getString(1)+ " "+resulsete.getString(2);
		lista.add(aux);
	}
	medicos=new String[lista.size()];
	for(int i=0;i<lista.size();i++){
		medicos[i]=lista.get(i);
		
	}
	ConexionMySql.desconectar();
	}catch(SQLException e){
		JOptionPane.showMessageDialog(null,e.getMessage());
	}
	return medicos;
}
public static void insertarEnTablaX(String sentenciaSql){
	
	try {
		ConexionMySql.conectar();
		ConexionMySql.statemente.executeUpdate(sentenciaSql);
		//JOptionPane.showMessageDialog(null,"Guardado con exito...");
		ConexionMySql.desconectar();
		//JOptionPane.showMessageDialog(null, "Anduvo");
		
	} catch (SQLException e) {
		
		JOptionPane.showMessageDialog(null," ERROR! \n" +e.getMessage());// TODO Auto-generated catch block
		e.printStackTrace();
		ConexionMySql.desconectar();
	}
	
	
}
	
public static void insertarEnDueño(int Dni,String nombre){
	String tabla="duenio";
		
		try {
			statemente.executeUpdate("INSERT INTO "+ tabla+" (dni,nombre)VALUES ('" + Dni + "','" + nombre + "')");
			
		    }
		catch (SQLException ex) {
			ex.getLocalizedMessage();
			System.out.println("Problema al meter dato a la base");
			Logger.getLogger(metodosSql.class.getName()).log(Level.SEVERE, null, ex);
		    }
	}

	public static void insertar(String tabla,String patente,String descripcion,String fecha){
		
		try {
			statemente.executeUpdate("INSERT INTO "+ tabla+" (PATENTE,DESCRIPCION,FECHA)VALUES ('" + patente + "','" + descripcion + "','"+fecha+"')");
			
		    }
		catch (SQLException ex) {
			ex.getLocalizedMessage();
			System.out.println("Problema al meter dato a la base");
			Logger.getLogger(metodosSql.class.getName()).log(Level.SEVERE, null, ex);
		    }
	}
	
public static void insertarFechaNull(String tabla,String patente,String descripcion){
		
		try {
			statemente.executeUpdate("INSERT INTO "+ tabla+" (PATENTE,DESCRIPCION,FECHA)VALUES " + " ('" + patente + "','" + descripcion + "',CURDATE())");
			JOptionPane.showMessageDialog(null, "Dato insertado con exito");
		    }
		catch (SQLException ex) {
			ex.getLocalizedMessage();
			JOptionPane.showMessageDialog(null, "Error en insertarFechaNull mejor pone la fecha");
			System.out.println("Problema al meter dato a la base");
			Logger.getLogger(metodosSql.class.getName()).log(Level.SEVERE, null, ex);
		    }
	}
public static void insertarII(String tabla,String columna1,String columna2,String columna3,String valor1,String valor2,String valor3){
		
		try {
			statemente.executeUpdate("INSERT INTO "+ tabla+" (" + columna1 + "," + columna2 +","+ columna3+")VALUES ('" + valor1 + "','" + valor2 +"','"+ valor3+"')");
			JOptionPane.showMessageDialog(null, "Dato insertado con exito");
		    }
		catch (SQLException ex) {
			ex.getLocalizedMessage();
			JOptionPane.showMessageDialog(null, "Problema al meter dato a la base, metodos linea 44");
			//System.out.println("Problema al meter dato a la base");
			Logger.getLogger(metodosSql.class.getName()).log(Level.SEVERE, null, ex);
		    }
	}

public static void tablaRelacionduenioAnimal(){
	
	try {
		ConexionMySql.resulsete = ConexionMySql.statemente.executeQuery("SELECT nombre,nombremasc FROM ungs.duenio,ungs.mascota,ungs.pertenece where duenio.dni=pertenece.duenio and mascota.nrolegajo=pertenece.mascota ;");
		while(ConexionMySql.resulsete.next()){
			
			System.out.println(resulsete.getString(1)+"  "+ resulsete.getString(2));
		
		
		
		}
		
	}catch(SQLException e){
		e.printStackTrace();
		JOptionPane.showMessageDialog(null, "No se puede consultar metodos linea 66");
		
	}
	
	
	
}
public static void mostrarTablas(){
	/*try {
		ConexionMySql.conectar();
		ConexionMySql.resulsete = ConexionMySql.statemente.executeQuery("SHOW TABLES");
		while(ConexionMySql.resulsete.next()){
			System.out.println(resulsete.getString(1));
		}
	
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	
	
	ConexionMySql.desconectar();*/
	JFrame pantalla=new JFrame();pantalla.setSize(710, 414);
	JPanel panel=new JPanel();
	JScrollPane ruedita=new JScrollPane();
	JTable tablas=new JTable();
	tablas=metodosSql.consultarGral("SHOW TABLES");//"select * from "+tablas+"where "+criterio+" = 408" );
	
	tablas.setPreferredScrollableViewportSize(new Dimension(1350,120));
	ruedita.add(tablas);
	ruedita.setViewportView(tablas);
	ruedita.setSize(1350, 100);
	panel.add(ruedita);
	pantalla.setContentPane(panel);
	pantalla.setVisible(true);
	
}
public static ArrayList<Object> listaDeElementosDeUnaFila(String consultaSql){
ArrayList<Object> lista=new ArrayList<Object>();
ConexionMySql.conectar();
try {
	ConexionMySql.resulsete=ConexionMySql.statemente.executeQuery(consultaSql);
	while(ConexionMySql.resulsete.next()){
		lista.add(resulsete.getString(1));
	}
	
	
} catch (SQLException e) {
	JOptionPane.showMessageDialog(null,e.getMessage());// TODO Auto-generated catch block
	e.printStackTrace();
}
ConexionMySql.desconectar();
	
	return lista;
}
public static int legajoMasGrande(String columna,String tabla){
	int valor=0;
	
	try {
		ConexionMySql.conectar();
		ConexionMySql.resulsete=ConexionMySql.statemente.executeQuery("select max("+columna+") from "+tabla);
		while(resulsete.next()){
			valor=Integer.parseInt(resulsete.getString(1));
		}
		ConexionMySql.desconectar();
	} catch (SQLException e) {
		JOptionPane.showMessageDialog(null, e.getMessage());// TODO Auto-generated catch block
		
	}
	return valor;
	
}
public static void consultarFull(String parametro) {//String selectFromTabla,String columna,String parametroDeConsulta){
	//no devuelve nada
	//@return 
	String tabla = null;
	int legajoMascota = 0;
	int bandera=0;
	if(parametro==null){
	     legajoMascota=Integer.parseInt(JOptionPane.showInputDialog("Inserte legajo de la mascota"));
	     bandera=1;
	}else{
		 tabla=parametro;
	}
		
		ConexionMySql.conectar();
		try {
			ConexionMySql.resulsete=ConexionMySql.statemente.executeQuery("show tables");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	
	JFrame pantalla=new JFrame();pantalla.setSize(710, 414);
	JPanel panel=new JPanel();
	JScrollPane ruedita=new JScrollPane();
	JTable tablas=new JTable();
	ConexionMySql.conectar();
	if(bandera==0){
	tablas=metodosSql.consultarGral("select * from "+tabla);//"select * from "+tablas+"where "+criterio+" = 408" );
	}else{
	tablas=	metodosSql.consultarGral("select * from mascota where nrolegajo= "+legajoMascota);
	}
	
	
	tablas.setPreferredScrollableViewportSize(new Dimension(1350,120));

	ruedita.setViewportView(tablas);
	ruedita.setSize(1350, 100);
	panel.add(ruedita);
	pantalla.setContentPane(panel);
	pantalla.setVisible(true);
		
}
/*	public static void VerDescXpatente(Clientes modelo,String patente1){
		
		try {
			ConexionMySql.resulsete = ConexionMySql.statemente.executeQuery("select descripcion,fecha from registros where patente =  '"+ patente1 +"'");
			while(ConexionMySql.resulsete.next()){
				String [] resultado=new String[2];
				
				resultado [0]=ConexionMySql.resulsete.getString(1);
				resultado [1]=ConexionMySql.resulsete.getString(2);
				
			
			modelo.ArrayDeClientesRegistros.add(resultado);
			
			}
			
		}catch(SQLException e){
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "No se puede consultar metodos linea 66");
			
		}
		
		
		
}*/
public static JTable consultarGral(String sentencia ){
	ConexionMySql.conectar();
	//TableColumnModel modeloColumnas = null;
	java.sql.ResultSetMetaData metadatos;
	
	DefaultTableModel modelo=new DefaultTableModel();//voy a modelar mi jtable
	
	JTable tablaDatos=new JTable(modelo);
	
	try {
	
	ConexionMySql.resulsete = ConexionMySql.statemente.executeQuery(sentencia);
	metadatos=resulsete.getMetaData();//extraigo datos sobre el resulset
	
	int cantColumnas=metadatos.getColumnCount();// pido cant columnas
	//no se como modelar tamaño de las columnas
	//modeloColumnas.setSelectionModel((ListSelectionModel) tablaDatos);
	
	
	
	for(int i=1;i<=cantColumnas;i++){
	modelo.addColumn(metadatos.getColumnName(i));
	
	
	}
	//avanzo por el resulset para mostrar resultado de consultas
	  while(ConexionMySql.resulsete.next()){
		// Bucle para cada resultado en la consulta
		 
		     // Se crea un array que será una de las filas de la tabla. 
		     Object [] fila = new Object[cantColumnas]; // Hay tres columnas en la tabla

		     // Se rellena cada posición del array con una de las columnas de la tabla en base de datos.
		     for (int i=0;i<cantColumnas;i++)
		        fila[i] = resulsete.getObject(i+1); // El primer indice en rs es el 1, no el cero, por eso se suma 1.

		     // Se añade al modelo la fila completa.
		     modelo.addRow(fila); 
		  }

	
	} 
	catch (SQLException e) {
		JOptionPane.showMessageDialog(null, e.getMessage());
		e.printStackTrace();
	}
	ConexionMySql.desconectar();
	return tablaDatos;
	

}

/*	public static void verTabla(Clientes modelo){
		String[] clienteAux=new String[3];
		//Mostrar datos de tabla
		try {
		ConexionMySql.resulsete = ConexionMySql.statemente.executeQuery("select * from registros ");
	
		//avanzo por el resulset para mostrar 
		  while(ConexionMySql.resulsete.next())
		 
			clienteAux [0]=ConexionMySql.resulsete.getString(1);
			clienteAux [1]=ConexionMySql.resulsete.getString(2);
		//muestro 2 columnas
		 System.out.println(ConexionMySql.resulsete.getString(1)+ "  "+ ConexionMySql.resulsete.getString(2));
		 
		modelo.ArrayDeClientesRegistros.add(clienteAux);

		} 
		catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "No se puede consultar metodos linea 87");
			e.printStackTrace();
		}

	}
*/
	public static void borrarXid(int Id1){
		try {
		
			statemente.executeUpdate("delete from registros where ID ="+Id1 );
			System.out.println("Borrado exitoso");
		    }
		catch (SQLException e) {
			e.printStackTrace();
		    }
		
	}
	public static void dameFoto(int id){
		id=6;
		int i=1;
		try {
			ConexionMySql.resulsete = ConexionMySql.statemente.executeQuery("SELECT IMAGEN FROM ungs.IMAGENES WHERE IDIMAGENES="+id);
			while (resulsete.next())
			
			System.out.println(ConexionMySql.resulsete.getString(1));
			
				

			} 
			catch (SQLException e) {
				JOptionPane.showMessageDialog(null, "No se puede consultar metodos linea 116");	e.printStackTrace();
			}
		
		
	
		
	}
	public static String dameNombre(String patente){
		String nombre=null;
		int i=1;
		try {
			ConexionMySql.resulsete = ConexionMySql.statemente.executeQuery("select nombre from cliente where patente =  '"+ patente +"'");
			while (resulsete.next())
			nombre=ConexionMySql.resulsete.getString(i);
			
			} 
			catch (SQLException e) {
				JOptionPane.showMessageDialog(null, "No se puede consultar metodos linea 133");
				e.printStackTrace();
			}
		
		
	return nombre;
		
	}
	public static String dameMarca(String patente){
		String marca=null;
		int i=1;
		try {
			ConexionMySql.resulsete = ConexionMySql.statemente.executeQuery("select marca from vehiculos where patente =  '"+ patente +"'");
			while (resulsete.next())
			marca=ConexionMySql.resulsete.getString(i);
			
			} 
			catch (SQLException e) {
				JOptionPane.showMessageDialog(null, "No se puede consultar metodos linea 151");
				e.printStackTrace();
			}
		
		
	return marca;
		
	}
	public static String dameModelo(String patente){
		String modelo=null;
		int i=1;
		try {
			ConexionMySql.resulsete = ConexionMySql.statemente.executeQuery("select modelo from vehiculos where patente =  '"+ patente +"'");
			while (resulsete.next())
			modelo=ConexionMySql.resulsete.getString(i);
			
			} 
			catch (SQLException e) {
				JOptionPane.showMessageDialog(null, "No se puede consultar metodos linea 169");
				e.printStackTrace();
			}
		
		
	return modelo;
		
	}
	public static int consultarXTablaXpatente(String tabla, String patente){
		int bandera=0;
		try{
			ConexionMySql.resulsete = ConexionMySql.statemente.executeQuery("select * from "+tabla);
			
			while (resulsete.next()){
				
				if (ConexionMySql.resulsete.getString(3).equals(patente) ){
					bandera=1;
					break;
				}
				
			}
			
		}
		catch(SQLException e){
			JOptionPane.showMessageDialog(null,"No se pudo consultar metodos,linea 193");
			
		}
		return bandera;
		
		
	}
	public static void contarCaracteres(JTextPane origen, JTextField contador){
		
		String pepe = origen.getText();  
		 int cont=pepe.length();
		 if(cont >= 100){
				JOptionPane.showMessageDialog(null,"Llegasta a 100 BASTA!!!");
				
			}
		contador.setText(Integer.toString(cont));
		//contarCaracteres(origen,contador);
		
	}
}

