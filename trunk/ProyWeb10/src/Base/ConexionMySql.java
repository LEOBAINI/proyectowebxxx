package Base;

import java.sql.*;



public class ConexionMySql {
	

        private  Connection c;
        protected  Statement statemente;
        protected  ResultSet resulsete;
        private  String base="proyectoweb";
        private  String host="localhost";
        private  String cadena="jdbc:mysql://"+host+"/"+base;
       // private static String cadena="jdbc:mysql://localhost/pruebas";
        private  String driver="com.mysql.jdbc.Driver";
       
        
        public String getBase() {
			return base;
		}



		public void setBase(String base) {
			this.base = base;
		}



		public String getHost() {
			return host;
		}



		public void setHost(String host) {
			this.host = host;
		}



		public ConexionMySql(){
        	
        }
        
        
       
        public void conectar(){
            try{
            	
                Class.forName(driver);
                c=DriverManager.getConnection(cadena,"root","root");
                 statemente=c.createStatement();
               //  System.out.println("Conectado OK");
                

            }catch(ClassNotFoundException e1){
             System.out.println("Error en los drivers");
            }
            catch(SQLException e2){
                System.out.println("Error en la conexion");

            }

    }
       
        public  void desconectar(){
        	//estado=new JTextField();
        	
				try {
					if (c != null){
						c.close();
						
						
						
					//	System.out.println("Conexión liberada OK");
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
