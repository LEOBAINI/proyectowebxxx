package pruebas;

import Base.ConexionMySql;
import Base.metodosSql;

public class pruebas {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		metodosSql metodos=new metodosSql();
		System.out.println(metodos.consultar("select * from handheld"));

	}

}
