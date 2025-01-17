package Abm;

import Base.metodosSql;

public class AdministradorABM {
	public AdministradorABM(){
		
	}
	
	public int darDeAlta(Persistente objeto,String base,String tabla) {
		metodosSql metodos=new metodosSql();
		
		
		return metodos.insertarObjetoAlaBase(objeto, base, tabla);
		
	}
	public int darDeBaja(Persistente objeto,String base,String tabla){
		metodosSql metodos=new metodosSql();
		
		return metodos.borrarObjetoDeLaBase(objeto, base, tabla);
		
		
	}
	
	public int InHabilitar(Persistente objeto,String base,String tabla){
		metodosSql metodos=new metodosSql();
		
		return metodos.inHabilitarObjetoDeLaBase(objeto, base, tabla);
		
		
	}
	
	
	public int modificar(Persistente objeto,String base,String tabla){
		metodosSql metodos=new metodosSql();
		return metodos.modificarObjetoDeLaBase(objeto, base, tabla);
		
	}
	/**
	 * Actualiza las dependencias de las subtareas con respecto a las tareas modificadas
	 * @param vieja (Tarea)
	 * @param nueva (Tarea)
	 * @return Devuelve 1 si se ejecut� correctamente sino -1.
	 */
	
	public int reasignarSubtareas(Tarea vieja,Tarea nueva){
		metodosSql metodos=new metodosSql();
		int idViejo=vieja.getIdTarea();
		int idNuevo=nueva.getIdTarea();
		return metodos.insertarOmodif("UPDATE `proyectoweb`.`subtarea` SET `TareaPadre`="+idNuevo+" WHERE `TareaPadre`='"+idViejo+"';");
	}
	/**
	 * Si devuelve 1 se efectu� ok sino devolver� -1.
	 * Recibe c�mo par�metro un usuario del tipo Usuario.
	 * Da de alta un usuario en la base insertando datos en tres tablas: personal,userlogin y mesesestado.
	 */
	
	public int darDeAltaUsuario(Usuario usuario){
		metodosSql metodos=new metodosSql();
		int status=0;
		
		status= metodos.insertarOmodif("INSERT INTO `proyectoweb`.`personal` (`Dni`, `Legajo`, `Apellido`, `Nombre`, `Direccion`, `Telefono`, `categoria`)"
		 + "VALUES ("+usuario.getDni()+", "+usuario.getLegajo()+", '"+usuario.getApellido()+"'," +
		 		" '"+usuario.getNombre()+"', '"+usuario.getDireccion()+"', '"+usuario.getTelefono()+"', "+usuario.getCategoria()+");");//primero en la base personal

		 
		status=status+ metodos.insertarOmodif("INSERT INTO `proyectoweb`.`userlogin` (`usuario`, `contrasenia`, `permiso`, `dni`)" +
		 		" VALUES ('"+usuario.getUsuario()+"', '"+usuario.getContrasenia()+"', '"+usuario.getPermiso()+"', "+usuario.getDni()+"); ");//segundo en user login
		 
		 
		status=status+ metodos.insertarOmodif("INSERT INTO `proyectoweb`.`mesesestado` (`usuario`, `"+metodos.dameNroTeDoyMes(metodos.dameMesActual())+"`, `ANIO`) " +
		 		"VALUES ('"+usuario.getUsuario()+"', 'ABIERTO', "+metodos.dameAnio()+");");//tercero en meses estado
		 if(status==3)
			 return 1 ;
		 else
			 return -1;
		
	}
	
}
