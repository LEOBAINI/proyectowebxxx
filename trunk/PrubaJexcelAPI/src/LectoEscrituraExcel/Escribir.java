package LectoEscrituraExcel;


import java.io.File;

import jxl.Cell;
import jxl.CellFeatures;
import jxl.CellType;
import jxl.Workbook;
import jxl.format.CellFormat;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableCell;
import jxl.write.WritableCellFeatures;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;


public class Escribir {
	LecturaExcel le;
	public Escribir(){
		
		
	}


        public void EscribirExcel(){
            try{

                    // Aquí se comienza a escribir el constructor de la información

                    WritableWorkbook libro = Workbook.createWorkbook(new File("D:\\Desktop\\pruebaLectura2.xls"));
                    // Para crear el nuevo libro


                    WritableSheet hoja1 = libro.createSheet("hojanueva", 0);

                    //Se crea una hoja dentro del libro de nombre hojanueva en la posición 0.

                    Label label = new Label(1,1,"Este es el mensaje que se muestra"); // Se crea el Label



                    hoja1.addCell(label);// Se escribe el Label en la celda

                    // Para escribir el array de valores en la hoja del libro

                    Label label2=new Label(3, 3, "Escribiendo en columna3 fila3");

                   

                           
                            
							
                    hoja1.addCell(label2);
                   
                    
                    libro.write();
                    libro.close();
            }catch(Exception eP){
                        eP.printStackTrace();
            }//Fin Catch
        }//Fin Constructor
}//Fin Clase


