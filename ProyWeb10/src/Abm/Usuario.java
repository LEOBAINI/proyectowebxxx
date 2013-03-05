package Abm;


import java.util.HashMap;

public class Usuario extends Persistente{
	//para tabla userlogin
	private String usuario;
	private String contrasenia;
	private String permiso;
	private int dni;
	//para tabla personal
	private int legajo;
	private String especialidad;
	private String apellido ;
	private String nombre;
	private String direccion;
	private String telefono;
	private int categoria;//obtener indice de tabla categoria
	
	private HashMap<Object, Object> todosLosAtributos;
	
	public Usuario(String usuario, String contrasenia, String permiso, int dni,int legajo,String especialidad,String apellido,
			String nombre,String direccion,String telefono,int categoria) {
		super();
		HashMap<Object, Object> atributos=new HashMap<Object,Object>();
		this.usuario = usuario;
		this.contrasenia = contrasenia;
		this.permiso = permiso;
		this.dni = dni;
		this.legajo=legajo;
		this.especialidad=especialidad;
		this.apellido=apellido;
		this.nombre=nombre;
		this.direccion=direccion;
		this.telefono=telefono;
		this.categoria=categoria;
		
		atributos.put("usuario", getUsuario());
		atributos.put("contrasenia",getContrasenia());
		atributos.put("permiso", getPermiso());
		atributos.put("dni", getDni());
		atributos.put("legajo", getLegajo());
		atributos.put("especialidad", getEspecialidad());
		atributos.put("nombre", getNombre());
		atributos.put("apellido", getApellido());
		atributos.put("direccion", getDireccion());
		atributos.put("telefono", getTelefono());
		atributos.put("categoria", getCategoria());
		
		this.todosLosAtributos=atributos;
		
	}
	

	

	public void setUsuario(String usuario) {
		this.usuario = usuario;
		this.todosLosAtributos.remove("usuario");
		this.todosLosAtributos.put("usuario", usuario);
	}

	

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
		this.todosLosAtributos.remove("contrasenia");
		this.todosLosAtributos.put("contrasenia", contrasenia);
	}

	

	public void setPermiso(String permiso) {
		this.permiso = permiso;
		this.todosLosAtributos.remove("permiso");
		this.todosLosAtributos.put("permiso", permiso);
	}

	

	public void setDni(int dni) {
		this.dni = dni;
		this.todosLosAtributos.remove("dni");
		this.todosLosAtributos.put("dni", dni);
	}
	
	public void setLegajo(String nombre) {
		this.nombre=nombre;
		this.todosLosAtributos.remove("nombre");
		this.todosLosAtributos.put("nombre", nombre);
	}
	
	public void setLegajo(int legajo) {
		this.legajo=legajo;
		this.todosLosAtributos.remove("legajo");
		this.todosLosAtributos.put("legajo", legajo);
	}
	public void setEspecialidad(String especialidad) {
		this.especialidad=especialidad;
		this.todosLosAtributos.remove("especialidad");
		this.todosLosAtributos.put("especialidad", especialidad);
	}
	
	public void setApellido(String apellido) {
		this.apellido=apellido;
		this.todosLosAtributos.remove("apellido");
		this.todosLosAtributos.put("apellido", apellido);
	}
	
	public void setNombre(String nombre) {
		this.nombre=nombre;
		this.todosLosAtributos.remove("nombre");
		this.todosLosAtributos.put("nombre", nombre);
	}
	
	public void setDireccion(String direccion) {
		this.direccion=direccion;
		this.todosLosAtributos.remove("direccion");
		this.todosLosAtributos.put("direccion", direccion);
	}
	
	public void setTelefono(String telefono) {
		this.telefono=telefono;
		this.todosLosAtributos.remove("telefono");
		this.todosLosAtributos.put("telefono", telefono);
	}
	
	public void setCategoria(int categoria) {
		this.categoria=categoria;
		this.todosLosAtributos.remove("categoria");
		this.todosLosAtributos.put("categoria", categoria);
	}
	
	public HashMap<Object, Object> todosLosAtributos(){
		return this.todosLosAtributos;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public String getPermiso() {
		return permiso;
	}
	

	public int getDni() {
		return dni;
	}
	public String getUsuario() {
		return usuario;
	}

	public int getLegajo() {
		return legajo;
	}


	public String getEspecialidad() {
		return especialidad;
	}


	public String getApellido() {
		return apellido;
	}


	public String getNombre() {
		return nombre;
	}


	public String getDireccion() {
		return direccion;
	}


	public String getTelefono() {
		return telefono;
	}


	public int getCategoria() {
		return categoria;
	}


	public HashMap<Object, Object> getTodosLosAtributos() {
		return todosLosAtributos;
	}




	
	public String identificadorUnico() {
		
		return "dni";
	}
	
	
	
	

	

}
