package Excel;

/*
 * 
 * @author Leonardo Baini <leobaini@hotmail.com>
 */

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import jxl.write.Number;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.CellFormat;
import jxl.format.Colour;
import jxl.format.Font;
import jxl.format.Format;
import jxl.format.Orientation;
import jxl.format.Pattern;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import jxl.*;


public class EscrituraExcel {
	LecturaExcel le;
	public EscrituraExcel(){
		super();
		
		
	}


        public void EscribirExcel(){
            try{

                    // Aqu� se comienza a escribir el constructor de la informaci�n

                    WritableWorkbook libro = Workbook.createWorkbook(new File("D:\\Desktop\\pruebaLectura2.xls"));
                    // Para crear el nuevo libro


                    WritableSheet hoja1 = libro.createSheet("hojanueva", 0);

                    //Se crea una hoja dentro del libro de nombre hojanueva en la posici�n 0.

                    Label label = new Label(1,1,"Este es el mensaje que se muestra"); // Se crea el Label



                    hoja1.addCell(label);// Se escribe el Label en la celda

                    // Para escribir el array de valores en la hoja del libro

                    Label label2=new Label(3, 3, "Escribiendo en columna3 fila3");

                   

                           
                            
							
                    hoja1.addCell(label2);
                   
                    
                    libro.write();
                    libro.close();
            }catch(Exception eP){
                        eP.printStackTrace();
            }
            
    }
        
        @SuppressWarnings("static-access")
		public String nombreDeArchivo(String usuario){
    		String nombre=null;
    		Calendar cal=Calendar.getInstance();
    		int dia=cal.get(cal.DAY_OF_MONTH);
    		int anio=cal.get(cal.YEAR);
    		int mes=cal.get(cal.MONTH)+1;
    		int hora=cal.get(cal.HOUR_OF_DAY);
    		int minuto=cal.get(cal.MINUTE);
    		
    		nombre=usuario+String.valueOf(anio+""+mes+""+dia+""+hora+""+minuto);
    		
    		
    		
    		return nombre;
    		
    	}
        
       
       /**
         * 
         * Crea un directorio con el Excel generado.
         * El directorio debe tener una unidad valida ej c: .
         * devuelve la ruta al archivo generado para as� poder generar un link-
         * La ruta debe terminar en \\.
         * Ej c:\\undirectorio\\otro directorio.
         * Si el directorio no existe, se crear� haciendo que cada usuario tenga su 
         * propio directorio.
         * 
         * Ta re bueno!!! no?, se me ocurri� a mi solito.
         * 
         * Escrito por Leonardo Baini.
         * 
         * 
         */
        public String crearExcelDesdeMatriz(ArrayList<ArrayList <String>> matriz,String rutaDestino,String usuario){
        	
        	String contenido=null;
        	String rutaFinal=null;
        	int fila=0;
        	int columna=0;
        	
        	
        	
        	
        	 try {
        		//Creando LibroNuevo
				WritableWorkbook libro = Workbook.createWorkbook(new File(rutaFinal=rutaDestino+nombreDeArchivo(usuario)+".xls"));
				
				
				//Creando una hoja para ese libro Nuevo en la posici�n 0.
				
				WritableSheet hoja1 = libro.createSheet("hojanueva", 0);
				
				
				for(int i=0;i<matriz.size();i++){//comienza primer ciclo
				fila=i;
				
					for(int j=0;j<matriz.get(0).size();j++){//comienza 2do ciclo
						
						columna=j;
						contenido=matriz.get(fila).get(columna);
						
						//Creando etiqueta (contenido de la celda) 
						try{
							if((columna==0 && fila>0)||(columna==7 && fila>0)){
							Number num=new Number(columna, fila,Double.parseDouble(contenido) );
							hoja1.addCell(num);
							}else{
								Label label = new Label(columna,fila,contenido);
								//Agregando la etiqueta a la celda de la hoja
								hoja1.addCell(label);
								
							}
							
						}catch(NumberFormatException e){
							System.out.println(e.getMessage()+" error al formatear celda");
							
						}
						
						
						
						
						
				
						
				
				
				
				
				}//termina 2do ciclo
					//System.out.print("\n");
				
				
			}//termina primer ciclo				
				
					
				//Escribir
				libro.write();
	                    
			    //Cerrar
				libro.close();
					
					
					
					
					
							
				
				
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				
				
				System.out.println("Directorio no existe, tratar� de crearlo...");
				
				File directorio = new File(rutaDestino);
				directorio.mkdirs();
				crearExcelDesdeMatriz( matriz,rutaDestino,usuario);
				
				
				
			} catch (RowsExceededException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("RowsExce");
			} catch (WriteException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("WriteException");
			}catch(IllegalStateException il){
				System.out.println(il.getMessage());
				
			}
       	
       	 
       	 
       	 
       	 
       	
        	
        	
        	
        	
        	return rutaFinal;
        }
}//Fin Clase


