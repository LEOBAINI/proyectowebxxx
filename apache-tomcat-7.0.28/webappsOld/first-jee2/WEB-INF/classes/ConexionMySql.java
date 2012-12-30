
import java.sql.*;

import javax.swing.*;

public class ConexionMySql {
	

        public static Connection c;
        public static Statement statemente;
        public static ResultSet resulsete;
        public static String cadena="jdbc:mysql://localhost/ungs";
        public static String driver="com.mysql.jdbc.Driver";
        public static JOptionPane cartel= new JOptionPane();
        public ConexionMySql(){
        	
        }
        
        
        public static void conectar(JTextField estado){
            try{
            	
                Class.forName(driver);
                c=DriverManager.getConnection(cadena,"root","root");
                 statemente=c.createStatement();
                 estado.setText("Conectado OK");
                

            }catch(ClassNotFoundException e1){
             estado.setText("Error en los drivers");
            }
            catch(SQLException e2){
                estado.setText("Error en la conexion");

            }

    }
        public static void conectar(){
            try{
            	
                Class.forName(driver);
                c=DriverManager.getConnection(cadena,"root","root");
                 statemente=c.createStatement();
                 System.out.println("Conectado OK");
                

            }catch(ClassNotFoundException e1){
             System.out.println("Error en los drivers");
            }
            catch(SQLException e2){
                System.out.println("Error en la conexion");

            }

    }
        public static void desconectar(JTextField estado){
        	//estado=new JTextField();
        	
				try {
					if (c != null){
						c.close();
						
						
						
						estado.setText("Conexión liberada OK");
					}
					else{
						estado.setText("Ya estaba desconectado");  
						
					}
					
					//statemente.close();
					
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					estado.setText("Desconectado incorrecto");
					e.printStackTrace();
				}
				
			
        }
        public static void desconectar(){
        	//estado=new JTextField();
        	
				try {
					if (c != null){
						c.close();
						
						
						
						System.out.println("Conexión liberada OK");
					}
					else{
						System.out.println("Ya estaba desconectado");
						
					}
					
					//statemente.close();
					
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					System.out.println("Desconectado incorrecto");
					e.printStackTrace();
				}
				
			
        }
}
