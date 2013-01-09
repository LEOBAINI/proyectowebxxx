package Excel;

import java.io.File;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;


public class LecturaExcel {


    public int numD; // Declaración del numero de valores a leer
    public int[] valores; // Vector de valores leídos
    
    
    public LecturaExcel(){
    	
    	
    }
    
    
    public void LeerHojaExcel(){
    
    try{

                //—————————————————————————–
    			String ruta="D:\\Desktop\\asado1012.xls";
    			
                Workbook libro = Workbook.getWorkbook(new File(ruta));

                // Para obtener el libro .xls

                Sheet hoja1 = libro.getSheet(0); 

                //Para obtener la hoja de la primera posición del libro
                //—————————————————————————–
                //Se crea la celda que se va a leer de la hoja posición (0, 0)

               
                int columnas=hoja1.getColumns();
                int filas=hoja1.getRows();
                
                System.out.print("Esta hoja tiene "+hoja1.getColumns()+" columnas");
                System.out.println(" y "+hoja1.getRows()+" filas");

                //Se le pasa el valor a un String para capturar la información

               

                //Se convierte el String en un numero para obtener el valor

               
                //——————————————————————————

                //La lectura del vector de datos se hace de la siguiente manera

                
             


                for(int fila=0; fila<filas; fila++){ //For de R
                	
                	for(int columna=0;columna<columnas;columna++){
                		
                		 Cell indRLeeAux =hoja1.getCell(columna, fila);//Lee los indices(Columna,fila);
                		 String IndiRLee = indRLeeAux.getContents();
                         System.out.print(IndiRLee+"\t"); // Imprimimos en consola
                		 
                		 
                		 
                	}
                	System.out.print("\n");



                       

                
                         }// Fin For de R
    
    }catch(Exception eP){
            
            eP.printStackTrace();
       }//fin catch
    } // Fin del método
} // Fin de la clase

