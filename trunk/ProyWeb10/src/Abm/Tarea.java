package Abm;

import java.util.HashMap;

public class Tarea extends Persistente {
	
	int idTarea;
	String descripcion;
	private HashMap<Object, Object> todosLosAtributos;
	
	
	public Tarea(int idTarea, String descripcion) {
		super();
		this.idTarea = idTarea;
		this.descripcion = descripcion;
        
		HashMap<Object, Object> atributos=new HashMap<Object,Object>();
		
		atributos.put("idTarea", getIdTarea());
		atributos.put("descripcion",getDescripcion());	
		
		this.todosLosAtributos=atributos;
	}

	public int getIdTarea() {
		return idTarea;
	}

	public void setIdTarea(int idTarea) {
		this.idTarea = idTarea;
		this.todosLosAtributos.remove("idTarea");
		this.todosLosAtributos.put("idTarea",idTarea);
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
		this.todosLosAtributos.remove("descripcion");
		this.todosLosAtributos.put("descripcion", descripcion);
	}

	public HashMap<Object, Object> todosLosAtributos() {
		
		return this.todosLosAtributos;
	}

	
	public String identificadorUnico() {
		
		return "idTarea";
	}

	

}
