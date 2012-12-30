package Abm;

import java.util.ArrayList;
import java.util.HashMap;

public class Usuario extends Persistente{
	
	private String usuario;
	private String contrasenia;
	private String permiso;
	private int dni;
	private HashMap<Object, Object> todosLosAtributos;
	
	public Usuario(String usuario, String contrasenia, String permiso, int dni) {
		super();
		HashMap<Object, Object> atributos=new HashMap<Object,Object>();
		this.usuario = usuario;
		this.contrasenia = contrasenia;
		this.permiso = permiso;
		this.dni = dni;
		atributos.put("usuario", getUsuario());
		atributos.put("contrasenia",getContrasenia());
		atributos.put("permiso", getPermiso());
		atributos.put("dni", getDni());
		
		this.todosLosAtributos=atributos;
		
	}
	

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
		this.todosLosAtributos.remove("usuario");
		this.todosLosAtributos.put("usuario", usuario);
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
		this.todosLosAtributos.remove("contrasenia");
		this.todosLosAtributos.put("contrasenia", contrasenia);
	}

	public String getPermiso() {
		return permiso;
	}

	public void setPermiso(String permiso) {
		this.permiso = permiso;
		this.todosLosAtributos.remove("permiso");
		this.todosLosAtributos.put("permiso", permiso);
	}

	public int getDni() {
		return dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
		this.todosLosAtributos.remove("dni");
		this.todosLosAtributos.put("dni", dni);
	}
	
	public HashMap<Object, Object> todosLosAtributos(){
		return this.todosLosAtributos;
	}


	
	public String identificadorUnico() {
		
		return "dni";
	}
	
	
	
	

	

}
