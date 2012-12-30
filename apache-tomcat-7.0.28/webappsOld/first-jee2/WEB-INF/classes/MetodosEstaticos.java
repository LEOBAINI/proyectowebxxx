import java.util.ArrayList;
import java.util.StringTokenizer;


public class MetodosEstaticos {
	
/*Este metodo recibe un arrayList de String con formato de hora
 * ejemplo  09:23:00 y las suma devolviendo un string con el resultado*/
	
	public static String sumarHoras(ArrayList<String> horas){
		String aux=null;
		int temp=0;
		for(int i=0;i<horas.size();i++){
			temp=temp+parsearHoraAMinutos(horas.get(i));
			
		}
		
		return transformarMinutosAhoraString(temp);
		
	}
	
	/*Este metodo transforma un String con formato de hora en minutos*/
	public static int parsearHoraAMinutos(String hora){
		StringTokenizer a=new StringTokenizer(hora);
		int hora_a=Integer.parseInt(a.nextToken(":"))*60;
		int minuto_a=Integer.parseInt(a.nextToken(":"));
		hora_a=hora_a+minuto_a;
		return hora_a;
	}
	
	public static String transformarMinutosAhoraString(int minutos){
		String resultado=null;
		int temp=minutos;
		int horaFinal=0;
		int minutoFinal=0;
		if(temp>60){
		while(temp>60){
			temp=temp-60;
			horaFinal++;
			minutoFinal=temp;
		}
		resultado=String.valueOf(horaFinal+":"+minutoFinal+":00");

		}else{
			
			resultado=String.valueOf(horaFinal+":"+temp+":00");
		}
				
				return resultado;		
		
	}
	
	
	
	
	
	
	

}
