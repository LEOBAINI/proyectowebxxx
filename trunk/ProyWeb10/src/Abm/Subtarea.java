package Abm;

import java.util.HashMap;

public  class Subtarea extends Persistente {
	
	int idSubtarea;
	int tareaPadre;
	String descripcion;
	private HashMap<Object, Object> todosLosAtributos;

	public Subtarea(int idSubtarea, int tareaPadre, String descripcion) {
		super();
		this.idSubtarea = idSubtarea;
		this.tareaPadre = tareaPadre;
		this.descripcion = descripcion;
		
        HashMap<Object, Object> atributos=new HashMap<Object,Object>();
		
		atributos.put("idSubtarea", getIdSubtarea());
		atributos.put("tareaPadre",getTareaPadre());	
		atributos.put("descripcion",getDescripcion());	
		
		this.todosLosAtributos=atributos;
	}
	public Subtarea(int idSubtarea, String descripcion) {
		super();
		this.idSubtarea = idSubtarea;
		
		this.descripcion = descripcion;
		
        HashMap<Object, Object> atributos=new HashMap<Object,Object>();
		
		atributos.put("idSubtarea", getIdSubtarea());
	
		atributos.put("descripcion",getDescripcion());	
		
		this.todosLosAtributos=atributos;
	}

	
	public int getIdSubtarea() {
		return idSubtarea;
	}


	public void setIdSubtarea(int idSubtarea) {
		this.idSubtarea = idSubtarea;
		this.todosLosAtributos.remove("idSubtarea");
		this.todosLosAtributos.put("idSubtarea", idSubtarea);
	}


	public int getTareaPadre() {
		return tareaPadre;
	}


	public void setTareaPadre(int tareaPadre) {
		this.tareaPadre = tareaPadre;
		this.todosLosAtributos.remove("tareaPadre");
		this.todosLosAtributos.put("tareaPadre", tareaPadre);
		
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

	@Override
	public String identificadorUnico() {
		
		return "idSubtarea";
	}

}