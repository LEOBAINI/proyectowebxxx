package seguridad;

import java.util.ArrayList;

import Base.metodosSql;

public class Validacion {

	public Validacion() {

	}

	// si el usuario tiene permisos los devuelve y dice que permiso tiene
	public String validarUsuario(String usuario, String contrasenia) {
		String permiso = null;
		
		if (usuario != null && contrasenia != null) {

			int columnaUser = 0;
			int columnaPass = 1;
			int columnaPermiso = 2;
			ArrayList<ArrayList<String>> matriz;

			metodosSql m = new metodosSql();
			matriz = m.consultar("select * from userlogin");
			for (int i = 0; i < matriz.size(); i++) {
				if (matriz.get(i).get(columnaUser).equals(usuario)) {
					if (matriz.get(i).get(columnaPass).equals(contrasenia)) {
						/*
						 * System.out.println("Usuario correcto");
						 * System.out.println(matriz.get(i).get(columnaUser));
						 * System.out.println(matriz.get(i).get(columnaPass));
						 * System
						 * .out.println(matriz.get(i).get(columnaPermiso));
						 */
						permiso = matriz.get(i).get(columnaPermiso);
						// flag=1;
					}
				}

			}
		}
		/*
		 * if(flag==0){
		 * System.out.println("usuario incorrecto intente de nuevo"); }
		 */
		return permiso;
	}

}
