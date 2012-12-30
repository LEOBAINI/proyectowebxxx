package Abm;

import java.util.HashMap;

public class Departamento extends Persistente {
	
	int idDepartamento;
	String descripcion;
	private HashMap<Object, Object> todosLosAtributos;
	
	
	public Departamento(int idDepartamento, String descripcion) {
		super();
		HashMap<Object, Object> atributos=new HashMap<Object,Object>();
		this.idDepartamento = idDepartamento;
		this.descripcion = descripcion;
		atributos.put("idDepartamento", getIdDepartamento());
		atributos.put("descripcion",getDescripcion());
		this.todosLosAtributos=atributos;
		
	}
	
	
	public int getIdDepartamento() {
		return idDepartamento;
	}
	public void setIdDepartamento(int idDepartamento) {
		this.idDepartamento = idDepartamento;
		this.todosLosAtributos.remove("idDepartamento");
		this.todosLosAtributos.put("idDepartamento", idDepartamento);
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
		
		return "idDepartamento";
	}
	
	

	

}
